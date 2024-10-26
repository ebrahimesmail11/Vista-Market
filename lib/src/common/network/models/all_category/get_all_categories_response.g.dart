// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponse _$GetAllCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesResponse(
      GetAllCategoriesResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllCategoriesResponseToJson(
        GetAllCategoriesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllCategoriesResponseData _$GetAllCategoriesResponseDataFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesResponseData(
      (json['categories'] as List<dynamic>)
          .map((e) => GetAllCategoriesResponseCategories.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCategoriesResponseDataToJson(
        GetAllCategoriesResponseData instance) =>
    <String, dynamic>{
      'categories': instance.categoriesList,
    };

GetAllCategoriesResponseCategories _$GetAllCategoriesResponseCategoriesFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesResponseCategories(
      json['id'] as String?,
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$GetAllCategoriesResponseCategoriesToJson(
        GetAllCategoriesResponseCategories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
