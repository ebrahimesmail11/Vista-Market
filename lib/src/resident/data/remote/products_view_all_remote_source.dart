import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/customer/products_view_all_quires.dart';

class ProductsViewAllRemoteSource {
  ProductsViewAllRemoteSource(this._apiService);
  final ApiService _apiService;
  Future<AllProductsResponse> getProductsViewAll({required int offset}) async {
    final response = await _apiService.getProductsViewAll(
      ProductsViewAllQuires().viewAllProductsQuery(offset: offset),
    );
    return response;
  }
}
