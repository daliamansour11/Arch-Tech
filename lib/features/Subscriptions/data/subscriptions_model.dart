import 'package:json_annotation/json_annotation.dart';
part 'subscriptions_model.g.dart';

@JsonSerializable()
class SubscriptionsModel {
  final String? title;
  @JsonKey(name: 'start_at')
  final String? startAt;
  @JsonKey(name: 'end_at')
  final String? endAt;

  const SubscriptionsModel(
      {required this.title, required this.startAt, required this.endAt});

  factory SubscriptionsModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionsModelFromJson(json);
}