// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      date: json['created_at'] as String,
      subTitle: json['description'] as String,
      title: json['title'] as String,
      id: json['id'] as int,
      is_seen: json['is_seen'] as bool,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'description': instance.subTitle,
      'title': instance.title,
      'id': instance.id,
      'date': instance.date,
      'is_seen': instance.is_seen,
    };
