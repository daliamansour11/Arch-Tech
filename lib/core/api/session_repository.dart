import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class SessionRepository {
  Future<void> saveToken(String token, String refreshToken);
  Future<void> clearSessionData();
  Future<void> setOnboardingCompleted();
  Future<String?> getToken();
  Future<bool> isAuthenticated();
  Future<bool> isOnboarding();

  Future<void> handleToken(DioException err, ErrorInterceptorHandler handler,
      RequestOptions options, Dio dio, BuildContext context);
}
