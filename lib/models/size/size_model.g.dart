// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeModel _$SizeModelFromJson(Map<String, dynamic> json) => SizeModel(
      id: json['id'] as int,
      size: json['size'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$SizeModelToJson(SizeModel instance) => <String, dynamic>{
      'size': instance.size,
      'id': instance.id,
      'slug': instance.slug,
    };
