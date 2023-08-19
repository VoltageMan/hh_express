import 'package:json_annotation/json_annotation.dart';
part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  final String name;
  final String image;
  final int id;
  final String slug;
  const BrandModel({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}
