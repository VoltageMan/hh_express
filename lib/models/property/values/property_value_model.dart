import 'package:json_annotation/json_annotation.dart';

part 'property_value_model.g.dart';

@JsonSerializable()
class PropertyValue {
  PropertyValue({
    required this.icon,
    required this.id,
    required this.value,
    this.isSelected = false,
    this.isColor = false,
  });
  final int id;
  final String? icon;
  final String value;
  @JsonKey(includeFromJson: false)
  bool isSelected;
  @JsonKey(includeFromJson: false)
  bool isColor;

  factory PropertyValue.fromJson(Map<String, dynamic> json) {
    return _$PropertyValueFromJson(json);
  }
  Map<String, dynamic> toJson() => _$PropertyValueToJson(this);
}
