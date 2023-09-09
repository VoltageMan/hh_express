import 'package:hh_express/models/prices_model/prices_model.dart';
import 'package:hh_express/models/property/property_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_product_model.g.dart';

@JsonSerializable()
class OrderProductModel extends PricesModel {
  final String prod_name;
  final List<String> images;
  final int prod_id;
  final int id;
  final String slug;
  final int cuantity;
  final List<PropertyModel> properties;

  const OrderProductModel({
    required this.id,
    required this.images,
    required this.slug,
    required this.properties,
    required this.cuantity,
    required super.shippingCost,
    required this.prod_id,
    required this.prod_name,
    required super.total,
    required super.weightCost,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderProductModelToJson(this);
}
