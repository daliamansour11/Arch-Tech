part of 'subscriptions_bloc.dart';

class SubscriptionsState {
  final String? error;
  final bool isLoading;
  final SubscriptionsModel? subscriptionsModel;

  const SubscriptionsState({
    this.error,
    this.isLoading = false,
    this.subscriptionsModel,
  });

  SubscriptionsState copyWith({
    String? error,
    bool? isLoading,
    SubscriptionsModel? subscriptionsModel,
  }) {
    return SubscriptionsState(
      error: error,
      isLoading: isLoading ?? false,
      subscriptionsModel: subscriptionsModel,
    );
  }
}