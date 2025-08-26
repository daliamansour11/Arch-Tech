import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/api/session_repository.dart';
import 'package:archtech/core/error/on_error_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppInterceptors extends Interceptor {
  final OnErrorHelper _onErrorHelper;
  final SessionRepository _sessionRepository;
  final String code;

  AppInterceptors({
    required OnErrorHelper onErrorHelper,
    required SessionRepository sessionRepository,
    required this.code,
  })  : _onErrorHelper = onErrorHelper,
        _sessionRepository = sessionRepository;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[StringManager.contentType] = StringManager.applicationJson;
    final isAuthenticated = await _sessionRepository.isAuthenticated();
    final String? token = await _sessionRepository.getToken();
    options.headers['Accept-Language'] = code;
    debugPrint('code: $code');
    if (isAuthenticated) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return _onErrorHelper.onError(err, handler);
  }
}
