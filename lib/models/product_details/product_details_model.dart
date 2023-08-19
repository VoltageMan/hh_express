import 'package:hh_express/models/color_model/color_model.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:hh_express/models/size/size_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  final int id;
  final String slug;
  final List<String> images;
  final String? discount;
  final String name;
  final String price;
  final String description;
  final List<SizeModel> sizes;
  final List<ColorModel> colors;
  final List<ProductModel> recomends;

  const ProductDetailsModel({
    required this.id,
    required this.slug,
    required this.images,
    required this.description,
    this.discount,
    required this.name,
    required this.price,
    required this.colors,
    required this.sizes,
    required this.recomends,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}
