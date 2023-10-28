import 'package:json_annotation/json_annotation.dart';

part 'cart_update_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CartUpdateModel {
  final int productId;
  final List<int> properties;
  final int quantity;
  const CartUpdateModel({
    required this.productId,
    required this.properties,
    required this.quantity,
  });
  CartUpdateModel changeQuantity({bool? remove}) {
    final model = CartUpdateModel(
      productId: productId,
      properties: properties,
      quantity: remove ?? false ? (quantity - 1) : (quantity + 1),
    );
    return model;
  }

  factory CartUpdateModel.fromJson(Map<String, dynamic> json) {
    return _$CartUpdateModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CartUpdateModelToJson(this);
}
