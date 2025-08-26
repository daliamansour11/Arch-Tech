import 'package:archtech/config/routes/app_router.dart';
import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/api/pretty_dio_logger.dart';
import 'package:archtech/core/api/session_repository.dart';
import 'package:archtech/core/api/status_code.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class OnErrorHelper {
  final SessionRepository _sessionRepository;
  final AppRouter _appRouter;

  OnErrorHelper({
    required SessionRepository sessionRepository,
    required AppRouter appRouter,
  })  : _sessionRepository = sessionRepository,
        _appRouter = appRouter;

  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final Dio dio = Dio()
      ..interceptors.add(const PrettyDioLogger())
      ..options.baseUrl = EndPoints.baseUrl
      ..options.receiveDataWhenStatusError = true
      ..options.followRedirects = false;
    final int? statusCode = err.response?.statusCode;
    final options = err.requestOptions
      ..validateStatus = (s) {
        return true;
      };

    try {
      final isAuthenticated = await _sessionRepository.isAuthenticated();
      if (statusCode == null) {
        debugPrint('AppInterceptors.onError: statusCode is null');
        final bool? result =
            await _appRouter.context?.pushNamed(RouteNames.noInternet);
        if (result ?? false) {
          debugPrint(
              'AppInterceptors.onError: navigating to internet connection page');
          return handler.resolve(await dio.fetch(options));
        } else {
          debugPrint(
              'AppInterceptors.onError: navigating to internet connection page failed');
        }
      } else if (statusCode == StatusCode.unauthorized && isAuthenticated) {
        debugPrint('AppInterceptors.onError: statusCode is unauthorized');
        await _sessionRepository.handleToken(
            err, handler, options, dio, _appRouter.context!);
      } else if (isAuthenticated) {
        debugPrint(
            'AppInterceptors.onError: statusCode is not unauthorized and token is not null');
        final error = ApiException.fromDioException(err);
        if (error.data['success'] != true) {
          final bool? re =
              await _appRouter.context?.errorDialog(error.messageKey);
          if (re ?? false) {
            debugPrint('AppInterceptors.onError: navigating to error 404 page');
            return handler.resolve(await dio.fetch(options));
          } else {
            debugPrint(
                'AppInterceptors.onError: navigating to error 404 page failed');
          }
        }
      }
      if (!handler.isCompleted) {
        debugPrint('AppInterceptors.onError: rejecting error');
        return handler.reject(err);
      }
    } catch (e) {
      debugPrint('AppInterceptors.onError: catch block');
      return handler.reject(err);
    }
  }
}
