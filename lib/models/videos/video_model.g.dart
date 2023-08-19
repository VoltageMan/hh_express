// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeVideoModel _$HomeVideoModelFromJson(Map<String, dynamic> json) =>
    HomeVideoModel(
      time: json['time'] as String,
      url: json['url'] as String,
      id: json['id'] as int,
      slug: json['slug'] as String,
      description: json['description'] as String,
      simmilars: (json['simmilars'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeVideoModelToJson(HomeVideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'time': instance.time,
      'url': instance.url,
      'description': instance.description,
      'simmilars': instance.simmilars,
    };
