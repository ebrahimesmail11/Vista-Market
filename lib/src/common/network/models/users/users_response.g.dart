// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) =>
    UsersResponse(
      UsersResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UsersResponseData _$UsersResponseDataFromJson(Map<String, dynamic> json) =>
    UsersResponseData(
      (json['users'] as List<dynamic>)
          .map((e) => UsersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersResponseDataToJson(UsersResponseData instance) =>
    <String, dynamic>{
      'users': instance.usersList,
    };

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      json['name'] as String?,
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
