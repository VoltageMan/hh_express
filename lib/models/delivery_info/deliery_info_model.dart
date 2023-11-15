import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryInfoModel {
  final String icon;
  final String text;
  DeliveryInfoModel({
    required this.icon,
    required this.text,
  });

  DeliveryInfoModel copyWith({
    String? icon,
    String? text,
  }) {
    return DeliveryInfoModel(
      icon: icon ?? this.icon,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon,
      'text': text,
    };
  }

  factory DeliveryInfoModel.fromMap(Map<String, dynamic> map) {
    return DeliveryInfoModel(
      icon: map['icon'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryInfoModel.fromJson(String source) => DeliveryInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeliveryInfoModel(icon: $icon, text: $text)';

  @override
  bool operator ==(covariant DeliveryInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.icon == icon &&
      other.text == text;
  }

  @override
  int get hashCode => icon.hashCode ^ text.hashCode;
  }
