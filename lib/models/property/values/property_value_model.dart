import 'package:json_annotation/json_annotation.dart';

part 'property_value_model.g.dart';

@JsonSerializable()
class PropertyValue {
  const PropertyValue({
    required this.icon,
    required this.id,
    required this.value,
    this.isSelected = false,
  });
  final int id;
  final String? icon;
  final String value;
  final bool isSelected;

  factory PropertyValue.fromJson(Map<String, dynamic> json) =>
      _$PropertyValueFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyValueToJson(this);
}
