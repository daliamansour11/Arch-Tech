import 'package:archtech/core/cache/cash_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'notification_cubit_state.dart';

class NotificationCubitCubit extends Cubit<NotificationCubitState> {
  NotificationCubitCubit(
      {required this.flutterLocalNotificationsPlugin,
      required this.cacheHelper,
      required this.firebaseMessaging})
      : super(const NotificationCubitState());
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final CacheHelper cacheHelper;
  final FirebaseMessaging firebaseMessaging;

  Future<void> initNotifications() async {
    // Request permissions (iOS)
    await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Init settings for both platforms
    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(initSettings);

    // Listen to messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final androidDetails = AndroidNotificationDetails(
        '2',
        '2',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        styleInformation: BigTextStyleInformation(
          message.notification?.body ?? '',
          htmlFormatBigText: true,
          contentTitle: message.notification?.title ?? '',
          htmlFormatContentTitle: true,
        ),
      );

      final notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: const DarwinNotificationDetails(),
      );

      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
        payload: message.notification?.body,
      );

      emit(state.copyWith(notifications: [...state.notifications, message]));
    });
  }
}
