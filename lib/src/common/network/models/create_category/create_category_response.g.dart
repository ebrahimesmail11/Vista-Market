// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryResponse _$CreateCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryResponse(
      CreateCategoryResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryResponseToJson(
        CreateCategoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CreateCategoryResponseData _$CreateCategoryResponseDataFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryResponseData(
      CreateAddCategory.fromJson(json['addCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryResponseDataToJson(
        CreateCategoryResponseData instance) =>
    <String, dynamic>{
      'addCategory': instance.addCategory,
    };

CreateAddCategory _$CreateAddCategoryFromJson(Map<String, dynamic> json) =>
    CreateAddCategory(
      json['id'] as String?,
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$CreateAddCategoryToJson(CreateAddCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
