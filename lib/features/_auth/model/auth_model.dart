import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(createFactory: false)
class AuthModel {
  final String email;
  final String password;
  final String? name;
  final String? role;
  @JsonKey(name: 'password_confirmation')
  final String? confirmPassword;

  AuthModel(
      {required this.email,
      required this.password,
      this.role,
      required this.name,
      required this.confirmPassword});

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
