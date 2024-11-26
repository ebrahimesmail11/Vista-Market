import 'package:vista_market/src/common/network/models/customer/product_details/product_details_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/customer/proudct_details_quires.dart';

class ProductDetailsRemoteSource {
  ProductDetailsRemoteSource(this._apiService);
  final ApiService _apiService;

  Future<ProductDetailsResponse> getProductsDetails({
    required int id,
  }) async {
    final response = await _apiService.getProductDetails(
      ProudctDetailsQuires().getProductDetails(id: id),
    );
    return response;
  }
}
