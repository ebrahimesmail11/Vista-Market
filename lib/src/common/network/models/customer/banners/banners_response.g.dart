// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      BannersResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BannersResponseData _$BannersResponseDataFromJson(Map<String, dynamic> json) =>
    BannersResponseData(
      (json['Products'] as List<dynamic>)
          .map((e) => BannersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannersResponseDataToJson(
        BannersResponseData instance) =>
    <String, dynamic>{
      'Products': instance.bannersProducts,
    };

BannersModel _$BannersModelFromJson(Map<String, dynamic> json) => BannersModel(
      json['title'] as String?,
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BannersModelToJson(BannersModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
    };
