import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/api/session_repository.dart';
import 'package:archtech/core/api/status_code.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/extension/material_banner_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SessionRepositoryImpl implements SessionRepository {
  final CacheHelper _cacheHelper;
  SessionRepositoryImpl(this._cacheHelper);

  @override
  Future<String?> getToken() {
    return _cacheHelper.getSecureData(key: StringManager.tokenKey);
  }

  @override
  Future<bool> isAuthenticated() async {
    final bool isAuthenticated = await getToken() != null;
    return isAuthenticated;
  }

  @override
  Future<void> saveToken(String token, String refreshToken) async {
    await _cacheHelper.saveSecureData(
        key: StringManager.tokenKey, value: token);
    _cacheHelper.saveSecureData(
        key: StringManager.refreshTokenKey, value: refreshToken);
  }
  

  @override
  Future<void> handleToken(DioException err, ErrorInterceptorHandler handler,
      RequestOptions options, Dio dio, BuildContext context) async {
    String? newAccessToken = await _reFreshToken(dio);
    debugPrint('newAccessToken: $newAccessToken');
    if (newAccessToken != null) {
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      return handler.resolve(await dio.fetch(options));
    } else {
      if (context.mounted) {
        await _sessionExpired(context);
      }
    }
  }

  Future<String?> _reFreshToken(Dio dio) async {
    try {
      final refreshToken =
          await _cacheHelper.getSecureData(key: StringManager.refreshTokenKey);

      final responseJson = await dio.post(EndPoints.refreshToken,
          data: {StringManager.refreshTokenKey: refreshToken});

      if (responseJson.statusCode == StatusCode.ok) {
        debugPrint('Response body: ${responseJson.data}');
        final responseBody = responseJson.data;
        // Extract access token and refresh token from the object
        final String? accessToken = responseBody['accessToken'];
        final String? refreshToken = responseBody['refreshToken'];

        if (accessToken != null && refreshToken != null) {
          // Save both tokens
          await saveToken(accessToken, refreshToken);

          return accessToken;
        }
      }
    } catch (error) {
      debugPrint('Refresh token error: $error');
      return null;
    }
    return null;
  }

  Future _sessionExpired(BuildContext context) async {
    context.showSessionExpiredMaterialBanner();
    clearSessionData();
    if (!context.mounted) return;
    context.clearMaterialBanners();
    context.pushNamedAndRemoveUntil(RouteNames.login);
    // await firebaseMessaging
    //     .deleteToken()
    //     .then((value) {})
    //     .onError((error, stackTrace) {
    //   if (!context.mounted) return;
    //   context.clearMaterialBanners();
    //   context.pushNamedAndRemoveUntil(RouteNames.login);
    // });
  }

  @override
  Future<void> clearSessionData() async {
    await _cacheHelper.removeSecureData(key: StringManager.tokenKey);
    await _cacheHelper.removeSecureData(key: StringManager.refreshTokenKey);
  }

  @override
  Future<bool> isOnboarding() async {
    final bool? isOnboardingCompleted =
        await _cacheHelper.getData(key: 'onboarding_completed');
    return isOnboardingCompleted ?? false;
  }

  @override
  Future<void> setOnboardingCompleted() async {
    await _cacheHelper.saveData(key: 'onboarding_completed', value: true);
  }
}
