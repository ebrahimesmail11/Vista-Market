// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponse _$ProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponse(
      ProductDetailsResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponseToJson(
        ProductDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductDetailsResponseData _$ProductDetailsResponseDataFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponseData(
      ProductDetailsResponseProduct.fromJson(
          json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponseDataToJson(
        ProductDetailsResponseData instance) =>
    <String, dynamic>{
      'product': instance.product,
    };

ProductDetailsResponseProduct _$ProductDetailsResponseProductFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponseProduct(
      json['id'] as String?,
      json['description'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['price'] as num?)?.toDouble(),
      json['title'] as String?,
      json['category'] == null
          ? null
          : CategoryDetailsModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponseProductToJson(
        ProductDetailsResponseProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'images': instance.images,
      'description': instance.description,
      'category': instance.category,
    };

CategoryDetailsModel _$CategoryDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CategoryDetailsModel(
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoryDetailsModelToJson(
        CategoryDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
