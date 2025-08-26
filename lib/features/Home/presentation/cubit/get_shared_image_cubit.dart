import 'package:archtech/core/api/api_consumer.dart';
import 'package:archtech/core/api/api_response.dart';
import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/error/api_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_shared_image_state.dart';
part 'get_shared_image_cubit.freezed.dart';

class GetSharedImageCubit extends Cubit<GetSharedImageState> {
  final ApiConsumer _apiConsumer;
  GetSharedImageCubit(this._apiConsumer)
      : super(const GetSharedImageState.initial());
  Future<void> getImages() async {
    emit(const GetSharedImageState.loading());
    try {
      final response = await _apiConsumer.get(EndPoints.shared);

      if (response.isSuccessful) {
        final List<dynamic> data = response.data['data'] ?? [];
        final List<String> images = [];

        if (data.isNotEmpty) {
          for (var element in data) {
            images.add(element['full_path'] ?? '');
          }
        }

        emit(GetSharedImageState.loaded(images: images));
      } else {
        emit(GetSharedImageState.error(message: response.errorMessage));
      }
    } on ApiException catch (error) {
      emit(GetSharedImageState.error(message: error.messageKey));
    }
  }
}
