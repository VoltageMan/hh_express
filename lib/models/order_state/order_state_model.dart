import 'dart:convert';

import 'package:hh_express/models/prices_model/prices_model.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_state_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderStateModel extends PricesModel {
  const OrderStateModel({
    required this.orderedProds,
    required this.id,
    required this.slug,
    required this.orderCode,
    required this.deliveryTime,
    required super.shippingCost,
    required super.total,
    required super.weightCost,
    required this.progres,
    required this.orderedTime,
  });
  final int id;
  final String slug;
  final List<ProductModel>? orderedProds;
  final String deliveryTime;
  final String orderCode;
  final String orderedTime;
  final List<String> progres;

  factory OrderStateModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStateModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStateModelToJson(this);
}
