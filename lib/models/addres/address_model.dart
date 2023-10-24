import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';
@JsonSerializable()
class AddressModel {
  final String uuid;
  final String address;
  const AddressModel({
    required this.address,
    required this.uuid,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
