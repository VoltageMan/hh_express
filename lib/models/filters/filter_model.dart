import 'package:hh_express/models/brand/brand_model.dart';
import 'package:hh_express/models/color_model/color_model.dart';
import 'package:hh_express/models/size/size_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  final int id;
  final String slug;
  final List<BrandModel> brands;
  final List<ColorModel> colors;
  final List<SizeModel> sizes;
  final bool by_most_saled;
  final bool by_news;
  const FilterModel({
    required this.id,
    required this.slug,
    required this.brands,
    required this.by_most_saled,
    required this.by_news,
    required this.colors,
    required this.sizes,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}
