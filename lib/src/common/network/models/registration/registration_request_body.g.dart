// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequestBody _$RegistrationRequestBodyFromJson(
        Map<String, dynamic> json) =>
    RegistrationRequestBody(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$RegistrationRequestBodyToJson(
        RegistrationRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
    };
