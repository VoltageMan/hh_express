// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      id: json['id'] as int,
      image: json['images'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      discount_price: json['discount_price'] as String?,
      name: json['name'] as String,
      sale_price: json['sale_price'] as String,
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'images': instance.image,
      'price': instance.price,
      'sale_price': instance.sale_price,
      'discount_price': instance.discount_price,
    };
