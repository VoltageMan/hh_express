// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      uuid: json['uuid'] as String,
      deliveryCost: json['delivery_cost'] as String,
      subTotal: json['sub_total'] as String,
      total: json['total'] as String,
      weightCost: json['weight_cost'] as String,
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => CartOrderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'total': instance.total,
      'sub_total': instance.subTotal,
      'weight_cost': instance.weightCost,
      'delivery_cost': instance.deliveryCost,
      'orders': instance.orders,
    };
