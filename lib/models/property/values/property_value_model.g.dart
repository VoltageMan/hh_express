// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyValue _$PropertyValueFromJson(Map<String, dynamic> json) =>
    PropertyValue(
      icon: json['icon'] as String?,
      id: json['id'] as int,
      value: json['value'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$PropertyValueToJson(PropertyValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'value': instance.value,
      'isSelected': instance.isSelected,
    };
