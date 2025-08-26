import 'dart:convert';

import 'package:archtech/core/api/status_code.dart';
import 'package:archtech/core/error/error_message.dart';
import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String messageKey; // Use a key instead of a hardcoded message
  final int? statusCode;
  final dynamic data;

  const ApiException({
    required this.messageKey,
    this.statusCode,
    this.data,
  });

  @override
  String toString() {
    return 'ApiException: $messageKey (statusCode: $statusCode, data: $data)';
  }

  /// Factory method to create an ApiException from a DioException
  factory ApiException.fromDioException(DioException dioException) {
    final statusCode = dioException.response?.statusCode;
    final responseData = dioException.response?.data;

    // Decode the response data if it's a JSON string
    dynamic decodedData;
    if (responseData != null && responseData is String) {
      try {
        decodedData = jsonDecode(responseData);
      } catch (e) {
        // If decoding fails, use the raw response data
        decodedData = responseData;
      }
    } else {
      decodedData = responseData;
    }

    String messageKey =
        _getErrorMessageKey(dioException.type, statusCode, decodedData);

    return ApiException(
      messageKey: messageKey,
      statusCode: statusCode,
      data: decodedData,
    );
  }

  /// Private method to map DioException types and status codes to localization keys
  static String _getErrorMessageKey(
      DioExceptionType type, int? statusCode, dynamic responseData) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return ErrorMessages.connectionTimeout;
      case DioExceptionType.receiveTimeout:
        return ErrorMessages.receiveTimeout;
      case DioExceptionType.sendTimeout:
        return ErrorMessages.sendTimeout;
      case DioExceptionType.cancel:
        return ErrorMessages.requestCancelled;
      case DioExceptionType.badResponse:
        return _handleHttpStatusCode(statusCode, responseData);
      case DioExceptionType.unknown:
        return ErrorMessages.unknownError;
      default:
        return ErrorMessages.unexpectedError;
    }
  }

  /// Method to handle specific HTTP status codes and provide localization keys
  static String _handleHttpStatusCode(int? statusCode, dynamic responseData) {
    // Handle server-specific error messages (e.g., validation errors)
    if (responseData != null && responseData is Map<String, dynamic>) {
      if (responseData.containsKey('errors')) {
        final errors = responseData['errors'];
        if (errors is Map<String, dynamic>) {
          // Handle specific field errors (e.g., email, password)
          if (errors.containsKey('email')) {
            return 'email_validation_error'; // Example key for email errors
          }
          if (errors.containsKey('password')) {
            return 'password_validation_error'; // Example key for password errors
          }
        }
      }

      // Handle the "message" field in the response
      if (responseData.containsKey('message')) {
        final message = responseData['message'];
        if (message == 'Invalid verification code.') {
          return ErrorMessages
              .invalidVerificationCode; // Localization key for invalid verification code
        }
        return 'server_message'; // Fallback key for other server messages
      }

      // Fallback to the "error" field if no specific errors or message are found
      if (responseData.containsKey('error')) {
        return 'server_error'; // Example key for server errors
      }
    }

    // Handle generic HTTP status codes
    switch (statusCode) {
      case StatusCode.badRequest:
        return ErrorMessages.badRequest;
      case StatusCode.unauthorized:
        return ErrorMessages.unauthorized;
      case StatusCode.forbidden:
        return ErrorMessages.forbidden;
      case StatusCode.notFound:
        return ErrorMessages.notFound;
      case StatusCode.conflicts:
        return ErrorMessages.conflicts;
      case StatusCode.internalServerError:
        return ErrorMessages.internalServerError;
      case StatusCode.badGateway:
        return ErrorMessages.badGateway;
      case StatusCode.serviceUnavailable:
        return ErrorMessages.serviceUnavailable;
      case StatusCode.gatewayTimeout:
        return ErrorMessages.gatewayTimeout;
      default:
        return ErrorMessages.invalidStatusCode;
    }
  }
}
