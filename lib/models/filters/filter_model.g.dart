// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      id: json['id'] as int,
      slug: json['slug'] as String,
      brands: (json['brands'] as List<dynamic>)
          .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      by_most_saled: json['by_most_saled'] as bool,
      by_news: json['by_news'] as bool,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['sizes'] as List<dynamic>)
          .map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'brands': instance.brands,
      'colors': instance.colors,
      'sizes': instance.sizes,
      'by_most_saled': instance.by_most_saled,
      'by_news': instance.by_news,
    };
