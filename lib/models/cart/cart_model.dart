import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CartModel {
  final int productId;
  final List<int> properties;
  const CartModel({
    required this.productId,
    required this.properties,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return _$CartModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
