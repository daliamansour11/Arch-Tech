import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/api/status_code.dart';
import 'package:archtech/core/error/error_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse with _$ApiResponse {
  factory ApiResponse(
      {required dynamic responseData, required int? statusCode}) = _ApiResponse;
}

extension ApiResponseExtension on ApiResponse {
  bool get isSuccessful => statusCode == StatusCode.ok;
  get data =>
      responseData ??
      {StringManager.errorKey: ErrorMessages.somethingWentWrong};
  String get errorMessage =>
      data[StringManager.errorKey] ?? ErrorMessages.somethingWentWrong;
}
