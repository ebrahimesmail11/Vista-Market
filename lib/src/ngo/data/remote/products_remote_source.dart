import 'dart:developer';

import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/models/create_product/create_product_request_body.dart';
import 'package:vista_market/src/common/network/models/create_product/create_product_response.dart';
import 'package:vista_market/src/common/network/service/graphql/admin/products_quires.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';

class ProductsRemoteSource {
  ProductsRemoteSource(this._apiService);
  final ApiService _apiService;

  Future<AllProductsResponse> getAllProducts() async {
    final response = await _apiService.getAllProducts(
      ProductsQuires().getAllProductsMapQuery(),
    );
    log('response: $response');
    return response;
  }

  Future<CreateProductResponse> createProduct({
    required CreateProductRequestBody body,
  }) async {
    final response = await _apiService.createProduct(
      ProductsQuires().creatProductsMapQuery(body: body),
    );

    return response;
  }
}
