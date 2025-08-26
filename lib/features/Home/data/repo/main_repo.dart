import 'dart:developer';

import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/injection.dart';
import 'package:archtech/features/Home/data/models/historical_information.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/cache/cash_helper.dart';
import '../models/runin_details_model.dart';

class RuinRepository {
  final CacheHelper cacheHelper;
  final apiConsumer = Injection.instance.apiConsumer;

  RuinRepository(this.cacheHelper, );

  Future<List<Ruin>> fetchRuins() async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getRuinsEndpoint,
      );

      if (response.isSuccessful) {
        if (response.data['data'] is List) {
          List<dynamic> data = response.data['data'];
          for (var element in data) {
            debugPrint('datadescription: ${element['description']}');
          }
          List<Ruin> ruins = data.map((item) => Ruin.fromJson(item)).toList();
          return ruins;
        } else {
          throw Exception(
              'Expected a list but got ${response.data['data'].runtimeType}');
        }
      } else {
        throw Exception(
            'Failed to load ruins: Status code ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Failed to load ruins: $e');
    }
  }

  Future<List<HistoricalInformation>> fetchHistoricalInformation() async {
    try {
      final response = await apiConsumer.get('get-archinfo');
      if (response.isSuccessful) {
        List<dynamic> data = response.data['data'];
        log(data.toString());
        return data
            .map((item) => HistoricalInformation.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load historical information');
      }
    } catch (e) {
      throw Exception('Failed to load historical information: $e');
    }
  }

  Future<RuinDetails> fetchDetails(int ruinId) async {
    try {
      final response = await apiConsumer.get(
        '${EndPoints.showRuinDetailsEndpoint}/$ruinId',
        queryParameters: {
          'lat': 30.0444, // position.latitude,
          'lng': 31.2357 //position.longitude,
        },
      );

      if (response.isSuccessful) {
        return RuinDetails.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load ruin details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> storeReview({required int review, required int ruinId}) async {
    try {
      final response = await apiConsumer.post(
          '${EndPoints.baseUrl}${EndPoints.storeReviewEndpoint}',
          body: {'ruin_id': ruinId, 'review': review},
          formDataIsEnabled: true);

      if (response.statusCode != 200) {
        throw Exception('Failed to store rate');
      }
    } catch (e) {
      throw Exception('Failed to store rate: $e');
    }
  }

  Future<List<Ruin>> fetchRuinsByType(String type) async {
    try {
      final response =
          await apiConsumer.get(EndPoints.getRuinsEndpoint, queryParameters: {
        'type': type,
      });

      if (response.isSuccessful) {
        if (response.data['data'] is List) {
          List<dynamic> data = response.data['data'];
          List<Ruin> ruins = data.map((item) => Ruin.fromJson(item)).toList();
          return ruins;
        } else {
          throw Exception(
              'Expected a list but got ${response.data['data'].runtimeType}');
        }
      } else {
        throw Exception(
            'Failed to load ruins: Status code ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Failed to load ruins: $e');
    }
  }
}
