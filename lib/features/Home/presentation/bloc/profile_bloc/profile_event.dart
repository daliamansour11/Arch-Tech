
import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}
class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String email;

  const UpdateProfileEvent({required this.name, required this.email});
}

class UploadProfilePhoto extends ProfileEvent {
  final File imageFile;

  const UploadProfilePhoto({required this.imageFile});

  @override
  List<Object> get props => [imageFile];
}