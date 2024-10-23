// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      ProductsResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductsResponseData _$ProductsResponseDataFromJson(
        Map<String, dynamic> json) =>
    ProductsResponseData(
      (json['products'] as List<dynamic>)
          .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsResponseDataToJson(
        ProductsResponseData instance) =>
    <String, dynamic>{
      'products': instance.productsList,
    };

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      json['title'] as String?,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
