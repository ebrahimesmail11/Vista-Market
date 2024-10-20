import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_response.g.dart';
@JsonSerializable()
class ProductsResponse {
  ProductsResponse(this.data);
  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
 final  ProductsResponseData data;
 String get productsTitleNumber {
  if(data.productsList.isEmpty) return '0';
   return data.productsList.length.toString();
 }
}

@JsonSerializable()
class ProductsResponseData {
  ProductsResponseData(this.productsList);
  factory ProductsResponseData.fromJson(Map<String, dynamic> json) => 
      _$ProductsResponseDataFromJson(json);
  @JsonKey(name: 'products')
  final List<ProductsModel> productsList;
}

@JsonSerializable()
class ProductsModel {
  ProductsModel(this.title);
  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  final String? title;
}
