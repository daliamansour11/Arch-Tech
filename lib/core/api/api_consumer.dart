import 'package:archtech/core/api/api_response.dart';
import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<ApiResponse> get(String path, {Map<String, dynamic>? queryParameters});
  Future<ApiResponse> post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool formDataIsEnabled = false,
      String? customBaseUrl,
      CancelToken? cancelToken,
      Options? options});
  Future<ApiResponse> put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool formDataIsEnabled = false});
  Future<ApiResponse> patch(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});
  Future<ApiResponse> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = true,
  });
  Future<Response<dynamic>> getHead(
    String path,
  );
}
