import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_response.g.dart';

@JsonSerializable()
class CreateProductResponse {
  CreateProductResponse(
    this.data,
  );
  factory CreateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseFromJson(json);
  final CreateProductResponseData data;
}

@JsonSerializable()
class CreateProductResponseData {
  CreateProductResponseData(
    this.createProduct,
  );
  factory CreateProductResponseData.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseDataFromJson(json);
  @JsonKey(name: 'addProduct')
  final CreateProductResponseDataCreateProduct createProduct;
}

@JsonSerializable()
class CreateProductResponseDataCreateProduct {
  CreateProductResponseDataCreateProduct(
    this.title,
  );
  factory CreateProductResponseDataCreateProduct.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CreateProductResponseDataCreateProductFromJson(json);
  final String? title;
}
