// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartOrderModel _$CartOrderModelFromJson(Map<String, dynamic> json) =>
    CartOrderModel(
      id: json['id'] as String,
      product:
          CartProductModel.fromJson(json['purchase'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      selectedPropsId: (json['selected_props_id'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CartOrderModelToJson(CartOrderModel instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'selected_props_id': instance.selectedPropsId,
      'purchase': instance.product,
      'id': instance.id,
    };
