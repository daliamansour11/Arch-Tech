import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../core/api/session_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Dio dio = Dio(); 
  final SessionRepository _sessionRepository = Injection.instance.sessionRepository;
  final CacheHelper _cacheHelper = Injection.instance.cacheHelper;


  ProfileBloc() : super(ProfilePhotoInitial()) {
    on<UploadProfilePhoto>(_onUploadProfilePhoto); 
    on<GetProfileEvent>(_onGetProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    dio.options.connectTimeout = const Duration(seconds: 20); 
    dio.options.receiveTimeout = const Duration(seconds: 20);
  }
   Future<void> _onGetProfile(GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfilePhotoLoading());
    try {
       final String? code = await _cacheHelper.getData(key: 'locale');
       String? token = await _sessionRepository.getToken();
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept-Language'] ='$code';

      final response = await dio.get('${EndPoints.baseUrl}profile',   options: Options(
  
  ),);
      if (response.statusCode == 200) {
        final data = response.data['data'];
        emit(ProfileLoaded(
          name: data['name'],
          email: data['email'],
          profileImage: data['profile_image'],
        ));
      } else {
        emit(const ProfileError('Failed to load profile'));
      }
    } catch (e) {
      emit(ProfileError('Error: $e'));
    }
  }

  Future<void> _onUpdateProfile(UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfilePhotoLoading());
    try {
       final String? code = await _cacheHelper.getData(key: 'locale');
       String? token = await _sessionRepository.getToken();
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept-Language'] ='$code';
      final response = await dio.post('${EndPoints.baseUrl}profile', data: {
        'name': event.name,
        'email': event.email,
      },   options: Options(
      
  ),);
      if (response.statusCode == 200) {
        final data = response.data['data'];
        emit(ProfileLoaded(
          name: data['name'],
          email: data['email'],
          profileImage: data['profile_image'],
        ));
      } else {
        emit(const ProfileError('Failed to update profile'));
      }
    } catch (e) {
      emit(ProfileError('Error: $e'));
    }
  }

Future<void> _onUploadProfilePhoto(
  UploadProfilePhoto event,
  Emitter<ProfileState> emit,
) async {
  emit(ProfilePhotoLoading()); 
  try {
    final String? code = await _cacheHelper.getData(key: 'locale');
    String? token = await _sessionRepository.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Accept-Language'] = '$code';
    
    final imageFile = event.imageFile;

    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        imageFile.path,
        filename: 'profile_photo.jpg', 
      ),
    });

    final response = await dio.post(
      '${EndPoints.baseUrl}profile', 
      data: formData,
    );

    if (response.statusCode == 200) {
      final newPhotoUrl = response.data['data']['profile_image'];
      
      await _cacheHelper.saveData(key: 'profile_image', value: newPhotoUrl);
      
      emit(ProfilePhotoSuccess(newPhotoUrl: newPhotoUrl)); 
    } else {
      emit(const ProfilePhotoFailure('Failed to upload photo')); 
    }
  } catch (e) {
    emit(ProfilePhotoFailure(e.toString()));
  }
}

}