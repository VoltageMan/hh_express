// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorModel _$ColorModelFromJson(Map<String, dynamic> json) => ColorModel(
      id: json['id'] as int,
      name: json['name'],
      value: json['value'],
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$ColorModelToJson(ColorModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'id': instance.id,
      'slug': instance.slug,
    };
