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
import 'package:http/http.dart' as http;
import 'package:in_app_purchase/in_app_purchase.dart';

class UpgradeCubit extends Cubit<UpgradeState> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final ApiConsumer _apiConsumer;
  final CacheHelper _cacheHelper;
  List<ProductDetails> _products = [];
  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;
  final CancelToken _cancelToken = CancelToken();

  UpgradeCubit(this._apiConsumer, this._cacheHelper)
      : super(const UpgradeState());

  Future<void> initialize() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      if (!isClosed) {
        emit(state.copyWith(error: StringManager.inAppPurchaseNotAvailable));
      }
      return;
    }

    await _loadSubscriptionProducts();
    _purchaseSubscription =
        _inAppPurchase.purchaseStream.listen(_handlePurchase);
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
      final purchaseParam = PurchaseParam(productDetails: product);
      await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    } on PlatformException catch (e) {
      _handlePurchaseError(e.message, e.code);
    } on InAppPurchaseException catch (e) {
      _handlePurchaseError(e.message, null);
    } catch (e) {
      _handlePurchaseError('An unexpected error occurred.', null);
    } finally {
      if (!isClosed) emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> restorePurchases() async {
    if (!isClosed) emit(state.copyWith(isLoading: true));
    try {
      final available = await _inAppPurchase.isAvailable();
      if (!available) {
        if (!isClosed) {
          emit(state.copyWith(
              isLoading: false,
              error: 'In-app purchases not available on this device.'));
        }
        return;
      }
      await _inAppPurchase.restorePurchases();
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(
            isLoading: false, error: 'Failed to restore purchases: $e'));
      }
    }
  }

  void _handlePurchase(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      switch (purchase.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          _sendPurchaseConfirmation(purchase);
          break;
        case PurchaseStatus.canceled:
          if (!isClosed) emit(state.copyWith(error: 'Subscription canceled.'));
          break;
        case PurchaseStatus.error:
          if (!isClosed) emit(state.copyWith(error: purchase.error?.message));
          break;
        case PurchaseStatus.pending:
          if (!isClosed) emit(state.copyWith(isLoading: true));
          break;
      }
    }
  }

  void _handlePurchaseError(String? message, String? code) {
    String errorMessage = message ?? 'Purchase failed. Please try again.';
    if (code == 'storekit_duplicate_product_object') {
      errorMessage = 'There is a pending transaction. Please wait a few moments';
    }
    if (!isClosed) emit(state.copyWith(error: errorMessage));
  }

  void selectPlan(ProductDetails plan) {
    if (!isClosed) emit(state.copyWith(product: plan));
  }

  Future<void> _sendPurchaseConfirmation(PurchaseDetails purchaseDetails) async {
    if (!isClosed) emit(state.copyWith(isLoading: true));

    try {
      final receiptData = purchaseDetails.verificationData.serverVerificationData;
      final result = await validateReceipt(receiptData);

      if (result['status'] == 0) {
        await _completePurchaseIfNeeded(purchaseDetails);
        if (!isClosed) emit(state.copyWith(isUpgraded: true));
      } else {
        _handleFailedTransaction('Receipt not valid: ${result['status']}', purchaseDetails);
      }
    } catch (e) {
      _handleFailedTransaction('Transaction failed: $e', purchaseDetails);
    } finally {
      if (!isClosed) emit(state.copyWith(isLoading: false));
    }
  }

  Future<Map<String, dynamic>> validateReceipt(String receiptData) async {
    const sharedSecret = 'YOUR_SHARED_SECRET_HERE';
    final prodUrl = Uri.parse('https://buy.itunes.apple.com/verifyReceipt');
    final sandboxUrl = Uri.parse('https://sandbox.itunes.apple.com/verifyReceipt');

    Map<String, dynamic> body = {
      'receipt-data': receiptData,
      'password': sharedSecret,
      'exclude-old-transactions': true,
    };

    try {
      final response = await http.post(prodUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body));

      final data = jsonDecode(response.body);

      if (data['status'] == 21007) {
        final sandboxResponse = await http.post(sandboxUrl,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body));
        return jsonDecode(sandboxResponse.body);
      }

      return data;
    } catch (e) {
      return {'status': -1, 'error': e.toString()};
    }
  }

  Future<void> _completePurchaseIfNeeded(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.pendingCompletePurchase) {
      await _inAppPurchase.completePurchase(purchaseDetails);
    }
  }

  void _handleFailedTransaction(String errorMessage, PurchaseDetails purchaseDetails) {
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
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    return super.close();
  }
}
