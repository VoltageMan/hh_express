import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  const NotificationModel({
    required this.date,
    required this.subTitle,
    required this.title,
    required this.slug,
    required this.id,
  });
  final String subTitle;
  final String title;
  final int id;
  final String slug;
  final String date;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
