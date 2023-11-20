import 'package:equatable/equatable.dart';
import 'package:hh_express/models/cart/cart_order_model/cart_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CartModel extends Equatable {
  final String uuid;
  final String total;
  final String subTotal;
  final String weightCost;
  final String deliveryCost;
  final List<CartOrderModel> orders;
  CartModel({
    required this.uuid,
    required this.deliveryCost,
    required this.subTotal,
    required this.total,
    required this.weightCost,
    this.orders = const [],
  });
  static const list = [];

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return _$CartModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  @override
  List<Object?> get props =>
      [uuid, total, subTotal, weightCost, deliveryCost, orders];
}
