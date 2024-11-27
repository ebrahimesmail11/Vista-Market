import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  ProductDetailsResponse(this.data);
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
  final ProductDetailsResponseData data;
}

@JsonSerializable()
class ProductDetailsResponseData {
  ProductDetailsResponseData(this.product);
  factory ProductDetailsResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseDataFromJson(json);
  final ProductDetailsResponseProduct product;
}

@JsonSerializable()
class ProductDetailsResponseProduct {
  ProductDetailsResponseProduct(
    this.description,
    this.images,
    this.price,
    this.title,
  );
  factory ProductDetailsResponseProduct.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseProductFromJson(json);
  final String? title;
  final double? price;
  final List<String>? images;
  final String? description;
}
