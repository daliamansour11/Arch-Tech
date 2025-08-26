import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_slider_cubit.freezed.dart';
part 'image_slider_state.dart';

class ImageSliderCubit extends Cubit<ImageSliderState> {
  final ApiConsumer _apiConsumer;
  ImageSliderCubit(this._apiConsumer) : super(const ImageSliderState.initial());
  Future<void> getImages() async {
  emit(const ImageSliderState.loading());
  try {
    final response = await _apiConsumer.get(EndPoints.sliders);

    if (response.isSuccessful) {
      final List<dynamic> data = response.data['data'] ?? [];

      final List<String> images = data
          .map((e) => e['image']?.toString())
          .where((url) => url != null && url.isNotEmpty)
          .cast<String>()
          .toList();

      emit(ImageSliderState.loaded(images));
    } else {
      emit(ImageSliderState.error(response.errorMessage));
    }
  } on ApiException catch (error) {
    emit(ImageSliderState.error(error.messageKey));
  }
}

}
