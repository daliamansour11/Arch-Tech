import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:flutter/material.dart';

final class AppRouter {
  final bool isOnboardingCompleted;
  final bool isAuthenticated;
  final CacheHelper cacheHelper;
  final bool isTourist;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  AppRouter(
      {required this.isOnboardingCompleted,
      required this.isAuthenticated,
      required this.isTourist,
      required this.cacheHelper});

  BuildContext? get context => navigatorKey.currentContext;
  ScaffoldMessengerState? get currentState => scaffoldMessengerKey.currentState;

  String get initialRoute {
    return isOnboardingCompleted
        ? isAuthenticated
            ? isTourist
                ? RouteNames.touristHome
                : RouteNames.recarcherHomeScreen
            : RouteNames.login
        : RouteNames.onboarding;
  }
}
