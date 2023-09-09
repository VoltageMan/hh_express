// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    OrderProductModel(
      id: json['id'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      slug: json['slug'] as String,
      properties: (json['properties'] as List<dynamic>)
          .map((e) => PropertyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cuantity: json['cuantity'] as int,
      shippingCost: json['shippingCost'] as String,
      prod_id: json['prod_id'] as int,
      prod_name: json['prod_name'] as String,
      total: json['total'] as String,
      weightCost: json['weightCost'] as String,
    );

Map<String, dynamic> _$OrderProductModelToJson(OrderProductModel instance) =>
    <String, dynamic>{
      'shippingCost': instance.shippingCost,
      'weightCost': instance.weightCost,
      'total': instance.total,
      'prod_name': instance.prod_name,
      'images': instance.images,
      'prod_id': instance.prod_id,
      'id': instance.id,
      'slug': instance.slug,
      'cuantity': instance.cuantity,
      'properties': instance.properties,
    };
