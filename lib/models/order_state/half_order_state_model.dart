import 'package:hh_express/models/prices_model/prices_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'half_order_state_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HalfOrderStateModel extends PricesModel {
  const HalfOrderStateModel({
    required this.id,
    required this.slug,
    required this.orderCode,
    required super.shippingCost,
    required super.total,
    required super.weightCost,
    required this.orderedTime,
  });
  final int id;
  final String slug;
  final String orderCode;
  final String orderedTime;
  factory HalfOrderStateModel.fromJson(Map<String, dynamic> json) =>
      _$HalfOrderStateModelFromJson(json);
  Map<String, dynamic> toJson() => _$HalfOrderStateModelToJson(this);
}
