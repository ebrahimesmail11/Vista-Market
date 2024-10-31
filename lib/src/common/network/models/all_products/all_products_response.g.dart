// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllProductsResponse _$AllProductsResponseFromJson(Map<String, dynamic> json) =>
    AllProductsResponse(
      AllProductsResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllProductsResponseToJson(
        AllProductsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AllProductsResponseData _$AllProductsResponseDataFromJson(
        Map<String, dynamic> json) =>
    AllProductsResponseData(
      (json['products'] as List<dynamic>)
          .map((e) =>
              AllProductsResponseProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllProductsResponseDataToJson(
        AllProductsResponseData instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

AllProductsResponseProduct _$AllProductsResponseProductFromJson(
        Map<String, dynamic> json) =>
    AllProductsResponseProduct(
      json['id'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['category'] == null
          ? null
          : CategoryProductModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllProductsResponseProductToJson(
        AllProductsResponseProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'category': instance.category,
    };

CategoryProductModel _$CategoryProductModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductModel(
      json['id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoryProductModelToJson(
        CategoryProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
