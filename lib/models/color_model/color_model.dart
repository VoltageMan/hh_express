import 'package:json_annotation/json_annotation.dart';
part 'color_model.g.dart';

@JsonSerializable()
class ColorModel {
  final dynamic value;
  final dynamic name;
  final int id;
  final String slug;
  const ColorModel({
    required this.id,
    required this.name,
    required this.value,
    required this.slug,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ColorModelToJson(this);
}
