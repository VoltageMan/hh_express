import 'package:hh_express/models/property/values/property_value_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'property_model.g.dart';

@JsonSerializable()
class PropertyModel {
  final int id;
  final List<PropertyValue> values;
  const PropertyModel({
    required this.id,
    required this.values,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}
