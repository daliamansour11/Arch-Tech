// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionsModel _$SubscriptionsModelFromJson(Map<String, dynamic> json) =>
    SubscriptionsModel(
      title: json['title'] as String?,
      startAt: json['start_at'] as String?,
      endAt: json['end_at'] as String?,
    );

Map<String, dynamic> _$SubscriptionsModelToJson(SubscriptionsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
    };
