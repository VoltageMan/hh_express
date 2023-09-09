// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      id: json['id'] as int,
      slug: json['slug'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      discount: json['discount'] as String?,
      name: json['name'] as String,
      price: json['price'] as String,
      properties: (json['properties'] as List<dynamic>)
          .map((e) => PropertyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recomends: (json['recomends'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        ProductDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'images': instance.images,
      'discount': instance.discount,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'properties': instance.properties,
      'recomends': instance.recomends,
    };
