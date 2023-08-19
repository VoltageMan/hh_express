import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String image;
  final String name;
  final String description;
  final String slug;
  final String price;
  final String? discount;
  final int id;

  const ProductModel({
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    required this.slug,
    this.discount,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
