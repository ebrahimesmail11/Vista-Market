// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoleModel _$UserRoleModelFromJson(Map<String, dynamic> json) =>
    UserRoleModel(
      (json['id'] as num?)?.toInt(),
      json['role'] as String?,
      json['email'] as String?,
      json['name'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$UserRoleModelToJson(UserRoleModel instance) =>
    <String, dynamic>{
      'role': instance.userRole,
      'id': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
    };
