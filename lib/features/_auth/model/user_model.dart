import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? name;
  final String? email;
  final String? updatedAt;
  final String? createdAt;
  final int? id;
  final String? role;
  final String? token;
  @JsonKey(name: 'profile_image')
  final String? image;

  const UserModel(
      {this.name,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.role,
      this.image,
      this.id,
      this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
