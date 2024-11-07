// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUsersResponse _$AllUsersResponseFromJson(Map<String, dynamic> json) =>
    AllUsersResponse(
      AllUsersResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllUsersResponseToJson(AllUsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AllUsersResponseData _$AllUsersResponseDataFromJson(
        Map<String, dynamic> json) =>
    AllUsersResponseData(
      (json['users'] as List<dynamic>)
          .map((e) =>
              AllUsersResponseDataUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllUsersResponseDataToJson(
        AllUsersResponseData instance) =>
    <String, dynamic>{
      'users': instance.users,
    };

AllUsersResponseDataUsers _$AllUsersResponseDataUsersFromJson(
        Map<String, dynamic> json) =>
    AllUsersResponseDataUsers(
      json['name'] as String?,
      json['id'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$AllUsersResponseDataUsersToJson(
        AllUsersResponseDataUsers instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
    };
