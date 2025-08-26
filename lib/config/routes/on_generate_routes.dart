import 'dart:io';
import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/injection.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:archtech/features/Home/presentation/bloc/cubit/ai_camera_cubit.dart';
import 'package:archtech/features/Home/presentation/bloc/google_map_bloc.dart';
import 'package:archtech/features/Home/presentation/bloc/home_bloc.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_event.dart';
import 'package:archtech/features/Home/presentation/cubit/get_shared_image_cubit.dart';
import 'package:archtech/features/Home/presentation/cubit/image_slider_cubit.dart';
import 'package:archtech/features/Home/presentation/pages/home_research.dart';
import 'package:archtech/features/Subscriptions/presentation/bloc/upgrade_cubit.dart';
import 'package:archtech/features/_auth/bloc/auth_bloc.dart';
import 'package:archtech/features/_auth/bloc/forget_password_bloc.dart';
import 'package:archtech/features/_auth/bloc/verification_code_bloc.dart';
import 'package:archtech/features/_on_boarding/bloc/on_boarding_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'route_imports.dart';

final class OnGenerateRoutes {
  static final Injection injection = Injection.instance;
  static final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker.createInstance();
  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute =
      (RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return _adaptiveNavigation(BlocProvider(
          create: (context) =>
              AuthBloc(injection.apiConsumer, injection.cacheHelper),
          child: const Login(),
        ));

      case RouteNames.onboarding:
        return _adaptiveNavigation(BlocProvider(
          create: (context) => OnboardingBloc(),
          child: const OnboardingScreen(),
        ));
      case RouteNames.notesScreen:
        return _adaptiveNavigation(const NotesScreen());
      case RouteNames.settingPage:
        return _adaptiveNavigation(const SettingPage());

      case RouteNames.code:
        final bool isForgotPassword = settings.arguments as bool;
        return _adaptiveNavigation(BlocProvider(
          create: (context) {
            return VerificationCodeBloc(
                injection.apiConsumer, injection.cacheHelper,
                isForgetPassword: isForgotPassword)
              ..add(const VerificationCodeEvent.startTimer());
          },
          child: OTPVerification(
            isForgetPassword: isForgotPassword,
          ),
        ));
      case RouteNames.archaeologicalLibrary:
        return _adaptiveNavigation(const ArchaeologicalLibrary());
      case RouteNames.archaeologicalInfo:
        return _adaptiveNavigation(const ArchaeologicalInfo());
      case RouteNames.filterSearch:
        return _adaptiveNavigation(const FilterSearch());
      case RouteNames.touristHome:
        return _adaptiveNavigation(MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainBloc(Injection.instance.cacheHelper,
                  Injection.instance.sessionRepository)
                ..add(FetchArch())
                ..add(FetchRuins()),
            ),
            BlocProvider(
              create: (context) =>
                  GoogleMapBloc()..add(const GoogleMapEvent.getMarker()),
            ),
            BlocProvider(
              create: (context) =>
                  ImageSliderCubit(Injection.instance.apiConsumer)..getImages(),
            ),
            BlocProvider(
              create: (context) =>
                  GetSharedImageCubit(Injection.instance.apiConsumer)
                    ..getImages(),
            ),
            BlocProvider(
              create: (context) =>
                  injection.subscriptionsBloc..getSubscriptions(),
            ),
            BlocProvider(
              lazy: false,
              create: (context) => HomeBloc(injection.apiConsumer)
                ..add(const HomeEvent.getRuins())
                ..add(const HomeEvent.getUserData()),
            ),
          ],
          child: const TouristHome(),
        ));
      case RouteNames.recarcherHomeScreen:
        return _adaptiveNavigation(MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainBloc(Injection.instance.cacheHelper,
                  Injection.instance.sessionRepository)
                ..add(FetchArch())
                ..add(FetchRuins()),
            ),
            BlocProvider(
              create: (context) =>
                  GoogleMapBloc()..add(const GoogleMapEvent.getMarker()),
            ),
            BlocProvider(
              create: (context) =>
                  ImageSliderCubit(Injection.instance.apiConsumer)..getImages(),
            ),
            BlocProvider(
              create: (context) =>
                  GetSharedImageCubit(Injection.instance.apiConsumer)
                    ..getImages(),
            ),
            BlocProvider(
              create: (context) =>
                  injection.subscriptionsBloc..getSubscriptions(),
            ),
            BlocProvider(
              lazy: false,
              create: (context) => HomeBloc(injection.apiConsumer)
                ..add(const HomeEvent.getRuins())
                ..add(const HomeEvent.getUserData()),
            ),
          ],
          child: const RecarcherHomeScreen(),
        ));
      case RouteNames.notification:
        return _adaptiveNavigation(BlocProvider(
          create: (context) => injection.notificationHelper,
          child: const NotificationPage(),
        ));
      case RouteNames.privacyPolicy:
        return _adaptiveNavigation(const PrivacyPolicy());
      case RouteNames.showRuinOnMap:
        final ruin = settings.arguments as Ruin;
        return _adaptiveNavigation(BlocProvider(
          create: (context) =>
              GoogleMapBloc()..add(GoogleMapEvent.goToRuin(ruin)),
          child: ShowRuinOnMap(
            ruin: ruin,
          ),
        ));
      case RouteNames.subscriptions:
        return _adaptiveNavigation(MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  UpgradeCubit(injection.apiConsumer, injection.cacheHelper)
                    ..initialize(),
            ),
            BlocProvider.value(
              value: injection.subscriptionsBloc,
            )
          ],
          child: const Subscriptions(),
        ));
      case RouteNames.updateProfile:
        return _adaptiveNavigation(const UpdateProfile());
      case RouteNames.forgotPassword:
        return _adaptiveNavigation(BlocProvider(
          create: (context) => ForgetPasswordBloc(injection.apiConsumer),
          child: const ForgetPassword(),
        ));
      case RouteNames.verifyEmail:
        return _adaptiveNavigation(const VerifyEmail());
      case RouteNames.newPassword:
        return _adaptiveNavigation(BlocProvider(
          create: (context) => ForgetPasswordBloc(injection.apiConsumer),
          child: const NewPassword(),
        ));
      case RouteNames.register:
        return _adaptiveNavigation(BlocProvider(
          create: (context) =>
              AuthBloc(injection.apiConsumer, injection.cacheHelper),
          child: Register(
            role: settings.arguments as String,
          ),
        ));
      case RouteNames.localeScreen:
        return _adaptiveNavigation(LocalePage(
          isLogin: settings.arguments as bool,
        ));
      case RouteNames.camera:
        return _adaptiveNavigation(BlocProvider(
          create: (context) =>
              AiCameraCubit(injection.apiConsumer, injection.cacheHelper),
          child: const Camera(),
        ));
      case RouteNames.startJourney:
        return _adaptiveNavigation(const StartJourney());

      case RouteNames.mainScreen:
        return _adaptiveNavigation(const MainScreen());
      case RouteNames.comments:
      case RouteNames.homeResearch:
        return _adaptiveNavigation(const HomeResearcher());

      case RouteNames.noInternet:
        return _adaptiveNavigation(InternetConnection(
          internetConnectionChecker: _internetConnectionChecker,
        ));
    }
    return null;
  };
}

Route _adaptiveNavigation(Widget child) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (_) => child);
  } else {
    return MaterialPageRoute(builder: (_) => child);
  }
}
