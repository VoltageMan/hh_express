// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      date: json['date'] as String,
      subTitle: json['subTitle'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'subTitle': instance.subTitle,
      'title': instance.title,
      'id': instance.id,
      'slug': instance.slug,
      'date': instance.date,
    };
