import 'package:archtech/config/locale/locale.dart';
import 'package:archtech/config/routes/app_router.dart';
import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/_notification.dart/cubit/notification_cubit_cubit.dart';
import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/app_interceptors.dart';
import 'package:archtech/core/api/dio_consumer.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/api/session_repository.dart';
import 'package:archtech/core/api/session_repository_impl.dart';
import 'package:archtech/core/bloc_observer.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/error/on_error_helper.dart';
import 'package:archtech/features/Subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:archtech/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injection {
  // Private constructor
  Injection._();

  // Singleton instance
  static final Injection instance = Injection._();

  // Objects to be injected
  late final AppRouter appRouter;
  late final CacheHelper cacheHelper;
  late final SessionRepository sessionRepository;
  late final ApiConsumer apiConsumer;
  late final AppLocale appLocale;
  late final NotificationCubitCubit notificationHelper;
  late final DioConsumer dioConsumer;
  late final SubscriptionsBloc subscriptionsBloc;

  // Initialization method
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // System-specific setup
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initialize high refresh rate for Android
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      debugPrint('Error setting high refresh rate: $e');
    }
    Bloc.observer = AppBlocObserver();
    // Create a single instance of the Injection class
    final injection = instance;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final CacheHelper cacheHelper = CacheHelper(sharedPreferences);
    // Initialize dependencies
    injection.cacheHelper = cacheHelper;
    final SessionRepository sessionRepository =
        SessionRepositoryImpl(cacheHelper);
    injection.sessionRepository = sessionRepository;
    final bool isOnboardingCompleted =
        await cacheHelper.getData(key: StringManager.onBoardingCacheKey) ??
            false;
    final bool isAuthenticated = await sessionRepository.isAuthenticated();

    final bool? isTourist =
        await cacheHelper.getData(key: StringManager.userRole);
    SessionData.isTourist = isTourist;

    injection.appRouter = AppRouter(
        cacheHelper: cacheHelper,
        isTourist: isTourist ?? false,
        isOnboardingCompleted: isOnboardingCompleted,
        isAuthenticated: isAuthenticated);
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    final notificationHelper = NotificationCubitCubit(
        cacheHelper: cacheHelper,
        firebaseMessaging: firebaseMessaging,
        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin);
    await notificationHelper.initNotifications();
    injection.notificationHelper = notificationHelper;
    final String code = await cacheHelper.getData(key: 'locale') ?? 'ar';
    injection.dioConsumer = DioConsumer(
      client: Dio(),
      appInterceptors: AppInterceptors(
        code: code,
        onErrorHelper: OnErrorHelper(
          sessionRepository: sessionRepository,
          appRouter: injection.appRouter,
        ),
        sessionRepository: sessionRepository,
      ),
    );
    injection.apiConsumer = DioConsumer(
      client: Dio(),
      appInterceptors: AppInterceptors(
        code: code,
        onErrorHelper: OnErrorHelper(
          sessionRepository: sessionRepository,
          appRouter: injection.appRouter,
        ),
        sessionRepository: sessionRepository,
      ),
    );
    injection.subscriptionsBloc = SubscriptionsBloc(injection.apiConsumer);

    injection.appLocale = await AppLocalesUtils.getAppLocale();
  }
}
