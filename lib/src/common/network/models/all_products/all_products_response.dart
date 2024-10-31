import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_products_response.g.dart';

@JsonSerializable()
class AllProductsResponse {
  AllProductsResponse(
    this.data,
  );
  factory AllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllProductsResponseFromJson(json);
  final AllProductsResponseData data;
  List<AllProductsResponseProduct> get products {
    if(data.products.isEmpty){
      return [];
    }else{
      return data.products;
    }
  }
}

@JsonSerializable()
class AllProductsResponseData {
  AllProductsResponseData(
    this.products,
  );
  factory AllProductsResponseData.fromJson(Map<String, dynamic> json) =>
      _$AllProductsResponseDataFromJson(json);
  final List<AllProductsResponseProduct> products;
}

@JsonSerializable()
class AllProductsResponseProduct {
  AllProductsResponseProduct(
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
  );
  factory AllProductsResponseProduct.fromJson(Map<String, dynamic> json) =>
      _$AllProductsResponseProductFromJson(json);
  final String id;
  final String title;
  final String description;
  final int price;
  final String image;
}
