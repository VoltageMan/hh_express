import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/property/values/property_value_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'property_model.g.dart';

@JsonSerializable()
class PropertyModel {
  final String name;
  final List<PropertyValue> values;
  PropertyModel({
    required this.values,
    required this.name,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    final valList = json.values.toList().first as List;
    final name = json.keys.toList().first;
    final values = valList.map((e) => PropertyValue.fromJson(e)).toList();
    return PropertyModel(
      name: name,
      values: values,
    );
  }
  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}
