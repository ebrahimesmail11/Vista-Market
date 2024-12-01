import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/models/search/search_request_body.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/customer/search_quires.dart';

class SearchRemoteSource {
  SearchRemoteSource(this._apiService);
  final ApiService _apiService;

  Future<AllProductsResponse> getSearchRemoteSource({
    required SearchRequestbody body,
  }) async {
    final response = await _apiService.getSearchProduct(
      SearchQuires().searchMapQuery(
        body: body,
      ),
    );
    return response;
  }
}
