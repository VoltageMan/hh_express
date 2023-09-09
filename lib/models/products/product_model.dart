import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake
)
class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String salePrice;
  @JsonKey(name: 'discount_price')
  final String? discount;
  @JsonKey(name: 'images')
  final String image;

  const ProductModel({
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    this.discount,
    required this.price,
    required this.salePrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

final some = {
  "id": 120,
  "name": "Est delectus veritatis.",
  "description": "  est quia voluptas.",
  "sale_price": "27.1",
  "price": "27.1",
  "discount_price": "0",
  "images": "http://216.250.9.74/storage/503/conversions/download-1-thumb.webp"
};
