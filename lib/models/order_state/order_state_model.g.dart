// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStateModel _$OrderStateModelFromJson(Map<String, dynamic> json) =>
    OrderStateModel(
      orderedProds: (json['ordered_prods'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
      slug: json['slug'] as String,
      orderCode: json['order_code'] as String,
      deliveryTime: json['delivery_time'] as String,
      shippingCost: json['shipping_cost'] as String,
      total: json['total'] as String,
      weightCost: json['weight_cost'] as String,
      progres:
          (json['progres'] as List<dynamic>).map((e) => e as String).toList(),
      orderedTime: json['ordered_time'] as String,
    );

Map<String, dynamic> _$OrderStateModelToJson(OrderStateModel instance) =>
    <String, dynamic>{
      'shipping_cost': instance.shippingCost,
      'weight_cost': instance.weightCost,
      'total': instance.total,
      'id': instance.id,
      'slug': instance.slug,
      'ordered_prods': instance.orderedProds,
      'delivery_time': instance.deliveryTime,
      'order_code': instance.orderCode,
      'ordered_time': instance.orderedTime,
      'progres': instance.progres,
    };
