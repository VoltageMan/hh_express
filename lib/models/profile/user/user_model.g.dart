// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      entity: json['entity'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'entity': instance.entity,
      'name': instance.name,
      'id': instance.id,
      'token': instance.token,
    };
