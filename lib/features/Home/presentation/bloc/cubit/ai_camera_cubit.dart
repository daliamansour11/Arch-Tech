import 'dart:convert';
import 'dart:io';

import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as path;

part 'ai_camera_cubit.freezed.dart';
part 'ai_camera_state.dart';

class AiCameraCubit extends Cubit<AiCameraState> {
  final CacheHelper cacheHelper;
  final ApiConsumer apiConsumer;
  AiCameraCubit(this.apiConsumer, this.cacheHelper)
      : super(const AiCameraState.initial());

  Future uploadAiImage(File image) async {
    emit(const AiCameraState.loading());
    try {
      // Create a MultipartFile for the image upload
      final fileName = path.basename(image.path);
      final fileExtension =
          path.extension(fileName).toLowerCase().replaceFirst('.', '');

      // Validate file extension
      final allowedExtensions = ['jpeg', 'png', 'jpg', 'gif'];
      if (!allowedExtensions.contains(fileExtension)) {
        emit(const AiCameraState.error(
            'Unsupported file type. Allowed types: jpeg, png, jpg, gif'));
        return;
      }

      // Check file size (optional, but recommended)
      final fileSize = await image.length();
      if (fileSize > 5 * 1024 * 1024) {
        // 5MB limit
        emit(const AiCameraState.error('File size exceeds 5MB limit'));
        return;
      }

      // Create MultipartFile
      // Convert to Base64
      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);

      // Create FormData
      //final formData = FormData.fromMap();
      final langCode = await cacheHelper.getData(key: 'locale');
      // Use Dio to upload the file
      final response = await apiConsumer.post(
        EndPoints.processImage,
        //formDataIsEnabled: true,
        customBaseUrl: EndPoints.aiBaseUrl,
        body: {'language': _getLanguage(langCode), 'image': base64Image},
      );

      if (response.isSuccessful) {
        emit( AiCameraState.loaded(response.data));
      } else {
        emit(AiCameraState.error(response.errorMessage));
      }
    } on ApiException catch (e) {
      emit(AiCameraState.error(e.messageKey));
    }
  }

  String _getLanguage(langCode) {
    switch (langCode) {
      case 'en':
        return 'English';
      case 'ar':
        return 'Arabic';
      case 'fr':
        return 'French';
      case 'zh':
        return 'China';
      default:
        return 'en';
    }
  }
}
