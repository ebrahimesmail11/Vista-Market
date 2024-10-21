// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      CategoriesResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesResponseData _$CategoriesResponseDataFromJson(
        Map<String, dynamic> json) =>
    CategoriesResponseData(
      (json['categories'] as List<dynamic>)
          .map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesResponseDataToJson(
        CategoriesResponseData instance) =>
    <String, dynamic>{
      'categories': instance.categoriesList,
    };

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
