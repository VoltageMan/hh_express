// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      productId: json['product_id'] as int,
      properties:
          (json['properties'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'product_id': instance.productId,
      'properties': instance.properties,
    };
