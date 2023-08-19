import 'package:json_annotation/json_annotation.dart';
part 'size_model.g.dart';

@JsonSerializable()
class SizeModel {
  final String size;
  final int id;
  final String slug;
  const SizeModel({
    required this.id,
    required this.size,
    required this.slug,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$SizeModelToJson(this);
}
