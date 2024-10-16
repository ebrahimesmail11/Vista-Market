// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationResponse _$RegistrationResponseFromJson(
        Map<String, dynamic> json) =>
    RegistrationResponse(
      RegistrationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegistrationResponseToJson(
        RegistrationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

RegistrationData _$RegistrationDataFromJson(Map<String, dynamic> json) =>
    RegistrationData(
      RegistrationAddUser.fromJson(json['addUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegistrationDataToJson(RegistrationData instance) =>
    <String, dynamic>{
      'addUser': instance.addUser,
    };

RegistrationAddUser _$RegistrationAddUserFromJson(Map<String, dynamic> json) =>
    RegistrationAddUser(
      json['id'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$RegistrationAddUserToJson(
        RegistrationAddUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };
