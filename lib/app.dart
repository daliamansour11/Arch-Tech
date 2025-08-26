import 'package:archtech/config/locale/app_localizations_setup.dart';
import 'package:archtech/config/locale/locale.dart';
import 'package:archtech/config/routes/on_generate_routes.dart';
import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/_settings/presentation/bloc/locale_cubit.dart';
import 'package:archtech/core/injection.dart';
import 'package:archtech/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  Injection get inj => Injection.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(inj.appLocale),
      child: BlocBuilder<LocaleCubit, AppLocale>(
        buildWhen: (previous, current) => previous.code != current.code,
        builder: (context, state) {
          final appRouter = inj.appRouter;
          return MaterialApp(
            title: StringManager.appName,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: OnGenerateRoutes.onGenerateRoute,
            navigatorKey: appRouter.navigatorKey,
            theme: AppTheme.lightTheme,
            scaffoldMessengerKey: appRouter.scaffoldMessengerKey,
            supportedLocales: AppLocalesUtils.supportedLocales,
            initialRoute: appRouter.initialRoute,
            locale: Locale(state.code),
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
