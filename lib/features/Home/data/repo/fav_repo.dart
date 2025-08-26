import 'dart:developer';

import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/api/session_repository.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/injection.dart';
import 'package:dio/dio.dart';

import '../models/favoraite_model.dart';

class FavoriteRepository {
  
  final Dio dio = Dio();
  final SessionRepository _sessionRepository =Injection.instance.sessionRepository;
  final CacheHelper _cacheHelper =Injection.instance.cacheHelper;


  FavoriteRepository() {
       dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);
  }

  Future<List<FavoriteRuin>> getFavorites() async {

    try {
      final String? code = await _cacheHelper.getData(key: 'locale');
       String? token = await _sessionRepository.getToken();
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept-Language'] ='$code';
      final response = await dio.get('${EndPoints.baseUrl}${EndPoints.getFavorite}');
      if (response.data['success']) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => FavoriteRuin.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load favorites');
      }
    } catch (e) {
      throw Exception('Failed to load favorites: $e');
    }
  }

  Future<bool> toggleFavorite(String type, int ruinId) async {
    try {

       final String? code = await _cacheHelper.getData(key: 'locale');
       String? token = await _sessionRepository.getToken();
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept-Language'] ='$code';
      final response = await dio.post(
        '${EndPoints.baseUrl}${EndPoints.addFavorite}',
        queryParameters: {
          'type': type,
          'ruin_id': ruinId,
        },
      );
      log(response.data.toString()); 

      if (response.statusCode == 200) {
        return true; 

      } else {
       return false;
      }
    } catch (e) {
      log('Error toggling favorite: $e'); 
      throw Exception('Failed to toggle favorite: $e');
    }
  
  }
}