import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:archtech/features/_auth/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiConsumer _apiConsumer;
  HomeBloc(this._apiConsumer) : super(const _Initial()) {
    on<HomeEvent>((event, emit) async {
      await event.whenOrNull(
        getUserData: () async {
          final responses = await _apiConsumer.get(EndPoints.getUserProfile);
          if (responses.isSuccessful) {
            final user = UserModel.fromJson(responses.data['data']);
            SessionData.userModel = user;
          }
        },
        getRuins: () async {
          emit(const HomeState.loading());
          try {
            final responses = await _apiConsumer.get(EndPoints.getRuins);
            if (responses.isSuccessful) {
              final RuinsModel data = RuinsModel.fromJson(responses.data);
              // Get the user's current location
              LocationPermission permission =
                  await Geolocator.checkPermission();
              if (permission == LocationPermission.denied) {
                permission = await Geolocator.requestPermission();
              }
              if (permission == LocationPermission.deniedForever) {
                emit(const HomeState.error(
                  message: 'Location permissions are permanently denied.',
                ));
                return;
              }
              final userPosition = await Geolocator.getCurrentPosition();

// Calculate distances for all ruins
              data.calculateDistances(
                  userPosition.latitude, userPosition.longitude);
              SessionData.ruins.addAll(data.data);
              debugPrint('SessionData.ruins: ${SessionData.ruins.length}');
              emit(HomeState.loaded(places: data.data));
            }
          } on ApiException catch (error) {
            debugPrint('error: ${error.messageKey}');
            emit(HomeState.error(message: error.messageKey));
          } catch (error) {
            emit(const HomeState.error(
                message: 'An unexpected error occurred. Please try again.'));
          }
        },
      );
    });
  }
}
