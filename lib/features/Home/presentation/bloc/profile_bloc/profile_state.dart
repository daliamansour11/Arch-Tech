
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfilePhotoInitial extends ProfileState {}

class ProfilePhotoLoading extends ProfileState {}

class ProfilePhotoSuccess extends ProfileState {
  final String newPhotoUrl;
  const ProfilePhotoSuccess({required this.newPhotoUrl});
}

class ProfilePhotoFailure extends ProfileState {
  final String error;

  const ProfilePhotoFailure(this.error);

  @override
  List<Object> get props => [error];
}
class ProfileLoaded extends ProfileState {
  final String name;
  final String email;
  final String profileImage;

  const ProfileLoaded({
    required this.name,
    required this.email,
    required this.profileImage,
  });
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);
}