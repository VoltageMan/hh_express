// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      entity: json['entity'] as String?,
      password: json['password'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'entity': instance.entity,
      'password': instance.password,
      'name': instance.name,
      'id': instance.id,
    };
