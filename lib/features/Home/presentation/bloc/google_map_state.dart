part of 'google_map_bloc.dart';

@freezed
class GoogleMapState with _$GoogleMapState {
  const factory GoogleMapState.initial() = _Initial;
  const factory GoogleMapState.loading() = _Loading;
  const factory GoogleMapState.pickLocation(Ruin ruins) = _PickLocation;
  const factory GoogleMapState.loaded() = _Loaded;
  const factory GoogleMapState.error({required String message}) = _Error;
}
