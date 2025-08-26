import 'dart:convert';

import 'package:archtech/core/_constants/constant.dart';
import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/app_interceptors.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'pretty_dio_logger.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  final AppInterceptors appInterceptors;

  DioConsumer({
    required this.client,
    required this.appInterceptors,
  }) {
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..connectTimeout = Constant.connectTimeout
      ..headers = Constant.headers
      ..receiveTimeout = Constant.receiveTimeout
      ..sendTimeout = Constant.connectTimeout
      ..receiveDataWhenStatusError = true
      ..validateStatus = (status) {
        return status != null && status >= 200 && status < 300;
      };

    if (kDebugMode) {
      client.interceptors.add(const PrettyDioLogger());
    }
    client.interceptors.add(appInterceptors);
  }
  @override
  Future<ApiResponse> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
      );

      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  @override
  Future<ApiResponse> post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      CancelToken? cancelToken,
      String? customBaseUrl,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      if (customBaseUrl != null) {
        client.options.baseUrl = customBaseUrl;
      }
      final response = await client.post(path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  @override
  Future<ApiResponse> put(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  ApiResponse _handleResponseAsJson(Response<dynamic> response) {
    try {
      final data = response.data.toString();
      final responseJson = jsonDecode(data);
      return ApiResponse(
          responseData: responseJson, statusCode: response.statusCode);
    } on FormatException catch (error) {
      return ApiResponse(responseData: {
        'error': error.message,
      }, statusCode: response.statusCode);
    }
  }

  @override
  Future<ApiResponse> patch(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.patch(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  @override
  Future<ApiResponse> delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool formDataIsEnabled = true}) async {
    try {
      final response = await client.delete(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  @override
  Future<Response<dynamic>> getHead(String path) async {
    try {
      final response = await client.head(
        path,
      );
      return response;
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }
}
