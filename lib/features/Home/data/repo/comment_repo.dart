import 'dart:developer';
import 'dart:io';

import 'package:archtech/core/api/pretty_dio_logger.dart';
import 'package:archtech/core/api/session_repository.dart';
import 'package:archtech/core/injection.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/cache/cash_helper.dart';
import '../models/comment_model.dart';

class CommentRepository {
  final Dio dio = Dio();
  final SessionRepository _sessionRepository =
      Injection.instance.sessionRepository;
  final CacheHelper _cacheHelper = Injection.instance.cacheHelper;

  CommentRepository() {
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);
  }

  Future<CommentModel> fetchAllComments(int ruinId) async {
    try {
      final String? code = await _cacheHelper.getData(key: 'locale');
      String? token = await _sessionRepository.getToken();
      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.headers['Accept-Language'] = '$code';
      final response = await dio.get(
        '${EndPoints.baseUrl}${EndPoints.fetchAllCommentsEndpoint}',
        queryParameters: {
          'ruin_id': ruinId,
        },
      );

      if (response.statusCode == 200) {
        return CommentModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch comments');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception(
            'Connection error: Please check your internet connection.');
      } else {
        throw Exception('Failed to fetch comments: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to fetch comments: $e');
    }
  }

  Future<void> storeComment({
    required int ruinId,
    String? description,
    File? image,
  }) async {
    try {
      final String? code = await _cacheHelper.getData(key: 'locale');
      String? token = await _sessionRepository.getToken();
      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.headers['Accept-Language'] = '$code';
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      dio.interceptors.add(const PrettyDioLogger());

      MultipartFile? imageFile;
      if (image != null) {
        imageFile = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
      }

      final formData = FormData.fromMap({
        if (description != null) 'description': description,
        'ruin_id': ruinId,
        if (imageFile != null) 'images[]': [imageFile],
      });

      final response = await dio.post(
        '${EndPoints.baseUrl}${EndPoints.storeCommentEndpoint}',
        data: formData,
      );

      if (response.statusCode != 200) {
        log(response.statusCode.toString());
        throw Exception('Failed to store comment: ${response.statusCode}');
      }
    } catch (e) {
      log('Error storing comment: $e');
      throw Exception('Failed to store comment: $e');
    }
  }

  Future<Map<String, dynamic>> likeComment(int commentId) async {
    try {
      final String? code = await _cacheHelper.getData(key: 'locale');
      String? token = await _sessionRepository.getToken();
      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.headers['Accept-Language'] = '$code';
      final response = await dio.post(
        '${EndPoints.baseUrl}${EndPoints.likeCommentEndpoint}',
        data: {
          'comment_id': commentId,
        },
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to like comment: $e');
    }
  }

  Future<Map<String, dynamic>> dislikeComment(int commentId) async {
    try {
      final String? code = await _cacheHelper.getData(key: 'locale');
      String? token = await _sessionRepository.getToken();
      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.headers['Accept-Language'] = '$code';
      final response = await dio.post(
        '${EndPoints.baseUrl}${EndPoints.dislikeCommentEndpoint}',
        data: {
          'comment_id': commentId,
        },
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to dislike comment: $e');
    }
  }
}
