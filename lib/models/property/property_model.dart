import 'package:hh_express/models/property/values/property_value_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'property_model.g.dart';

@JsonSerializable()
class PropertyModel {
  final String name;
  final List<PropertyValue> values;
  @JsonKey(includeFromJson: false)
  bool? isColor;
  PropertyModel({
    required this.values,
    required this.name,
    this.isColor,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    final model = _$PropertyModelFromJson(json);
    if (model.values.any((element) => element.icon != null)) {
      model.paint();
    }
    return model;
    // final valList = json.values.toList().first as List;
    // final name = json.keys.toList().first;
    // final values = valList.map((e) => PropertyValue.fromJson(e)).toList();
    // return PropertyModel(
    //   name: name,
    //   values: values,
    // );
  }
  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);

  void paint() {
    this.isColor = true;
    return this.values.forEach((element) => element.isColor = true);
  }
}
