import 'dart:io';

import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:archtech/features/Subscriptions/data/subscriptions_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'subscriptions_state.dart';

class SubscriptionsBloc extends Cubit<SubscriptionsState> {
  final ApiConsumer _apiConsumer;
  SubscriptionsBloc(this._apiConsumer) : super(const SubscriptionsState());

  Future getSubscriptions() async {
    emit(state.copyWith(isLoading: true));
    try {
      final responses = await _apiConsumer.get('profile');
      if (responses.isSuccessful) {
        final subscriptions = SubscriptionsModel.fromJson(
            responses.data['data']['subscription_details']);
        SessionData.subscriptionsModel = subscriptions;
      }
      emit(state.copyWith(subscriptionsModel: SessionData.subscriptionsModel));
    } on ApiException catch (e) {
      emit(state.copyWith(error: e.toString()));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> cancelSubscription() async {
    if (!isClosed) emit(state.copyWith(isLoading: true));

    try {
      if (Platform.isAndroid) {
        // Open Google Play Store subscription management page
        final url = Uri.parse(
          'https://play.google.com/store/account/subscriptions',
        );
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          if (!isClosed) {
            emit(state.copyWith(error: 'Could not launch Google Play Store.'));
          }
        }
      } else if (Platform.isIOS) {
        // Open Apple App Store subscription management page
        final url = Uri.parse('https://apps.apple.com/account/subscriptions');
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          if (!isClosed) {
            emit(state.copyWith(error: 'Could not launch Apple App Store.'));
          }
        }
      } else {
        if (!isClosed) emit(state.copyWith(error: 'Platform not supported.'));
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            error:
                'Failed to open subscription management page: ${e.toString()}',
          ),
        );
      }
    } finally {
      if (!isClosed) emit(state.copyWith(isLoading: false));
    }
  }
}