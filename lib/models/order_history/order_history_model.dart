import 'package:hh_express/models/cart/cart_order_model/cart_order_model.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_history_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderHistoryModel {
  final String uuid;
  final String total;
  final String deliveryCost;
  final String subTotal;
  final String status;
  final String statusTrans;

  final List<CartOrderModel> orders;

  const OrderHistoryModel({
    required this.deliveryCost,
    required this.orders,
    required this.status,
    required this.statusTrans,
    required this.total,
    required this.subTotal,
    required this.uuid,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderHistoryModelToJson(this);
}


//  "uuid": "9a6e9bc2-c655-4ad5-a94f-09d66c4a82b8",
//           "total": "2606.6",
//           "delivery_cost": "50",
//           "weight_cost": "5",
//           "sub_total": "2661.6",
//           "status": "PENDING",
//           "status_trans": "PENDING",