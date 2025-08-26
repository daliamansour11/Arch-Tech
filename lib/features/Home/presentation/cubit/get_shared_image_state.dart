part of 'get_shared_image_cubit.dart';

@freezed
class GetSharedImageState with _$GetSharedImageState {
  const factory GetSharedImageState.initial() = _Initial;

  const factory GetSharedImageState.loading() = _Loading;

  const factory GetSharedImageState.loaded({required List<String> images}) =
      _Loaded;

  const factory GetSharedImageState.error({required String message}) = _Error;
}
