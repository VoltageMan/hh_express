import 'package:hh_express/models/cart/cart_product_model/cart_product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_order_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CartOrderModel {
  final int quantity;
  final List<int>? selectedPropsId;
  @JsonKey(name: 'purchase')
  final CartProductModel product;
  final String id;
  const CartOrderModel({
    required this.id,
    required this.product,
    required this.quantity,
    this.selectedPropsId = const [],
  });

  factory CartOrderModel.fromJson(Map<String, dynamic> json) {
    return _$CartOrderModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CartOrderModelToJson(this);
}
