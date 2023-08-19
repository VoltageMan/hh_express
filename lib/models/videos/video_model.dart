

import 'package:hh_express/models/products/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HomeVideoModel {
  const HomeVideoModel({
    required this.time,
    required this.url,
    required this.id,
    required this.slug,
    required this.description,
    required this.simmilars,
  });
  final int id;
  final String slug;
  final String time;
  final String url;
  final String description;
  final List<ProductModel>? simmilars;

  factory HomeVideoModel.fromJson(Map<String, dynamic> json) =>
      _$HomeVideoModelFromJson(json);
}
