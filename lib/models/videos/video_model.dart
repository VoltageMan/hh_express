

import 'package:hh_express/models/products/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HomeVideoModel {
  final int id;
  final String name;
  final String url;
  HomeVideoModel({
    required this.id,
    required this.name,
    required this.url,
  });

  HomeVideoModel copyWith({
    int? id,
    String? name,
    String? url,
  }) {
    return HomeVideoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'url': url,
    };
  }

  factory HomeVideoModel.fromMap(Map<String, dynamic> map) {
    return HomeVideoModel(
      id: map['id'] as int,
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeVideoModel.fromJson(String source) =>
      HomeVideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomeVideoModel(id: $id, name: $name, url: $url)';

  @override
  bool operator ==(covariant HomeVideoModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ url.hashCode;
}
