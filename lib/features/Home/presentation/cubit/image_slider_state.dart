part of 'image_slider_cubit.dart';

@freezed
class ImageSliderState with _$ImageSliderState {
  const factory ImageSliderState.initial() = _Initial;
  const factory ImageSliderState.loading() = _Loading;
  const factory ImageSliderState.loaded(List<String> images) = _Loaded;
  const factory ImageSliderState.error(String message) = _Error;
}
