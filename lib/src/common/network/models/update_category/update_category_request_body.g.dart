// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_category_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCategoryRequestBody _$UpdateCategoryRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateCategoryRequestBody(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UpdateCategoryRequestBodyToJson(
        UpdateCategoryRequestBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
