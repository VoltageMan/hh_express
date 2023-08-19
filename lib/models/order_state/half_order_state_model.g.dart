// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'half_order_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HalfOrderStateModel _$HalfOrderStateModelFromJson(Map<String, dynamic> json) =>
    HalfOrderStateModel(
      id: json['id'] as int,
      slug: json['slug'] as String,
      orderCode: json['order_code'] as String,
      shippingCost: json['shipping_cost'] as String,
      total: json['total'] as String,
      weightCost: json['weight_cost'] as String,
      orderedTime: json['ordered_time'] as String,
    );

Map<String, dynamic> _$HalfOrderStateModelToJson(
        HalfOrderStateModel instance) =>
    <String, dynamic>{
      'shipping_cost': instance.shippingCost,
      'weight_cost': instance.weightCost,
      'total': instance.total,
      'id': instance.id,
      'slug': instance.slug,
      'order_code': instance.orderCode,
      'ordered_time': instance.orderedTime,
    };
