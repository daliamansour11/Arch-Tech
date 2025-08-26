import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:archtech/features/Subscriptions/data/apple_payment_model.dart';
import 'package:archtech/features/Subscriptions/presentation/bloc/upgrade_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class UpgradeCubit extends Cubit<UpgradeState> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final ApiConsumer _apiConsumer;
  final CacheHelper _cacheHelper;
  List<ProductDetails> _products = [];
  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;

  UpgradeCubit(this._apiConsumer, this._cacheHelper)
      : super(const UpgradeState());

  Future<void> initialize() async {
    // Check if in-app purchases are available
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      if (!isClosed) {
        emit(state.copyWith(error: StringManager.inAppPurchaseNotAvailable));
      }
      return;
    }

    // Load subscription products
    await _loadSubscriptionProducts();

    // Listen for purchase updates
    _purchaseSubscription = _inAppPurchase.purchaseStream.listen((
      purchaseDetailsList,
    ) {
      _handlePurchase(purchaseDetailsList);
    });
  }

  Future<void> _loadSubscriptionProducts() async {
    if (!isClosed) emit(state.copyWith(isLoading: true));

    try {
      const productIds = {
        'com.archtech.annual',
        'com.archtech.monthly',
        'com.archtech.six_month',
      };

      final ProductDetailsResponse response =
          await _inAppPurchase.queryProductDetails(productIds);

      if (response.notFoundIDs.isNotEmpty) {
        debugPrint('response.notFoundIDs.isNotEmpty: ${response.notFoundIDs}');
        if (!isClosed) {
          emit(state.copyWith(error: StringManager.productsNotFound));
        }
        return;
      }

      _products = response.productDetails;
      if (!isClosed) {
        emit(state.copyWith(product: _products.first, products: _products));
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(error: 'Failed to load products: ${e.toString()}'));
      }
    }
  }

  Future<void> purchaseSubscription(ProductDetails product) async {
    if (!isClosed) emit(state.copyWith(isLoading: true));

    try {
      final PurchaseParam purchaseParam = PurchaseParam(
        productDetails: product,
      );
      await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    } on PlatformException catch (e) {
      // Handle PlatformException (e.g., duplicate product, network issues, etc.)
      debugPrint('Purchase failed (PlatformException): ${e.message}');

      String errorMessage = 'Purchase failed. Please try again.';
      if (e.code == 'storekit_duplicate_product_object') {
        errorMessage =
            'There is a pending transaction. Please wait a few moments';
      } else if (e.code == 'storekit_unknown' || e.code == 'storekit_error') {
        errorMessage = 'An unknown error occurred. Please try again later.';
      }

      if (!isClosed) {
        emit(state.copyWith(error: errorMessage));
      }
    } on InAppPurchaseException catch (e) {
      // Handle InAppPurchase-specific exceptions
      debugPrint('Purchase failed (InAppPurchaseException): ${e.message}');

      String errorMessage = 'Purchase failed. Please try again.';
      if (e.message?.contains('network') ?? false) {
        errorMessage = 'Network error. Please check your internet connection.';
      }

      if (!isClosed) {
        emit(state.copyWith(error: errorMessage));
      }
    } catch (e) {
      // Handle any other exceptions
      debugPrint('Purchase failed (Unexpected error): $e');

      if (!isClosed) {
        emit(
          state.copyWith(
            error: 'An unexpected error occurred. Please try again later.',
          ),
        );
      }
    } finally {
      // Ensure loading is turned off
      if (!isClosed) {
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  void _handlePurchase(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchaseDetails in purchaseDetailsList) {
      switch (purchaseDetails.status) {
        case PurchaseStatus.purchased:
          _sendPurchaseConfirmation(purchaseDetails);

          break;
        case PurchaseStatus.canceled:
          if (!isClosed) {
            emit(state.copyWith(error: 'Subscription purchase canceled.'));
          }
          break;
        case PurchaseStatus.error:
          if (!isClosed) {
            emit(state.copyWith(error: purchaseDetails.error?.message));
          }
          debugPrint(purchaseDetails.error?.message);
          break;
        case PurchaseStatus.pending:
          _inAppPurchase.completePurchase(purchaseDetails);
          break;
        case PurchaseStatus.restored:
          break;
      }
    }
  }

  void selectPlan(ProductDetails plan) {
    if (!isClosed) emit(state.copyWith(product: plan));
  }

  Future<void> _sendPurchaseConfirmation(
    PurchaseDetails purchaseDetails,
  ) async {
    if (!isClosed) emit(state.copyWith(isLoading: true));
    try {
      final String id = await _cacheHelper.getData(key: 'id') ?? '';

      // final bool isIOS = Platform.isIOS;

      final ApiResponse response = await _sendDataPurchase(id, purchaseDetails);
      if (isClosed) return;

      if (response.isSuccessful) {
        await _completePurchaseIfNeeded(purchaseDetails);

        if (!isClosed) emit(state.copyWith(isUpgraded: true));
      } else {
        _handleFailedTransaction(response.errorMessage, purchaseDetails);
      }
    } on InAppPurchaseException catch (error) {
      _handleFailedTransaction(
          error.message ?? 'Transaction failed.', purchaseDetails);
    } on ApiException catch (error) {
      _handleFailedTransaction(error.messageKey, purchaseDetails);
    } catch (error) {
      _handleFailedTransaction(
          StringManager.somethingWentWrong, purchaseDetails);
    }
  }

  final CancelToken _cancelToken = CancelToken();

  Future<ApiResponse> _sendDataPurchase(
    String userId,
    PurchaseDetails purchaseDetails,
  ) async {
    if (Platform.isAndroid) {
      final verificationData =
          purchaseDetails.verificationData.localVerificationData;
      final Map<String, dynamic> parsedData = jsonDecode(verificationData);

      return await _apiConsumer.post(EndPoints.payment,
          cancelToken: _cancelToken, body: parsedData);
    } else {
      final receiptData =
          purchaseDetails.verificationData.serverVerificationData;
      if (receiptData.isEmpty) {
        throw const ApiException(messageKey: 'Invalid receipt data');
      }

      final model = ApplePaymentModel(
        userId: userId,
        receiptData: receiptData,
        type: 'Apple',
        transactionId: purchaseDetails.purchaseID ?? '',
        productId: purchaseDetails.productID,
        purchaseDateMs: DateTime.now().millisecondsSinceEpoch,
        
      );
      return await _apiConsumer.post(
        EndPoints.payment,
        body: model.toJson(),
      );
    }
  }

  Future<void> _completePurchaseIfNeeded(
      PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.pendingCompletePurchase) {
      await _inAppPurchase.completePurchase(purchaseDetails);
    }
  }

  void _handleFailedTransaction(
      String errorMessage, PurchaseDetails purchaseDetails) {
    if (!isClosed) emit(state.copyWith(error: errorMessage));
    if (purchaseDetails.pendingCompletePurchase) {
      if (!isClosed) {
        emit(state.copyWith(
            error: 'There is a pending transaction. Please try again later.'));
      }
    }
  }

  @override
  Future<void> close() {
    _purchaseSubscription?.cancel();
    if (!_cancelToken.isCancelled) {
      _cancelToken.cancel();
    }
    return super.close();
  }
}
