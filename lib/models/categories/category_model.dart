import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart' ;
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  const CategoryModel({
    required this.image,
    required this.name,
    required this.slug,
    required this.id,
  });
  final String name;
  @JsonKey(name: 'media')
  final String image;
  final int id;
  final String slug;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Pizza {
  const Pizza({
    required this.name,
    this.width = 100,
    this.withMeat,
  });

  final double width;
  final String name;
  final bool? withMeat;
}
