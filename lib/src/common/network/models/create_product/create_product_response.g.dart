// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductResponse _$CreateProductResponseFromJson(
        Map<String, dynamic> json) =>
    CreateProductResponse(
      CreateProductResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductResponseToJson(
        CreateProductResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CreateProductResponseData _$CreateProductResponseDataFromJson(
        Map<String, dynamic> json) =>
    CreateProductResponseData(
      CreateProductResponseDataCreateProduct.fromJson(
          json['addProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductResponseDataToJson(
        CreateProductResponseData instance) =>
    <String, dynamic>{
      'addProduct': instance.createProduct,
    };

CreateProductResponseDataCreateProduct
    _$CreateProductResponseDataCreateProductFromJson(
            Map<String, dynamic> json) =>
        CreateProductResponseDataCreateProduct(
          json['title'] as String?,
        );

Map<String, dynamic> _$CreateProductResponseDataCreateProductToJson(
        CreateProductResponseDataCreateProduct instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
