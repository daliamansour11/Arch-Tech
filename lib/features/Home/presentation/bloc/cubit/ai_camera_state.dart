part of 'ai_camera_cubit.dart';

@freezed
class AiCameraState with _$AiCameraState {
  const factory AiCameraState.initial() = _Initial;
  const factory AiCameraState.loading() = _Loading;
  const factory AiCameraState.loaded(dynamic data) = _Loaded;
  const factory AiCameraState.error(String message) = _Error;
}
