part of 'notification_cubit_cubit.dart';

class NotificationCubitState {
  final List<RemoteMessage> notifications;
  const NotificationCubitState({this.notifications = const []});

  NotificationCubitState copyWith({List<RemoteMessage>? notifications}) {
    return NotificationCubitState(
      notifications: notifications ?? this.notifications,
    );
  }
}
