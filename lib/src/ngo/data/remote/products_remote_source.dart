import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/service/graphql/admin/products_quires.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';

class ProductsRemoteSource {
  ProductsRemoteSource(this._apiService);
  final ApiService _apiService;

  Future<AllProductsResponse> getAllProducts() async {
    final response = await _apiService.getAllProducts(
      ProductsQuires().getAllProductsMapQuery(),
    );

    return response;
  }
}
