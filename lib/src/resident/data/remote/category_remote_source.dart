import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/customer/category_quires.dart';

class CategoryRemoteSource {
  CategoryRemoteSource(this._apiService);
  final ApiService _apiService;
  Future<AllProductsResponse> getCategory({required int categoryId}) async {
    final response = await _apiService.getCategory(
      CategoryQuires().getAllCategories(categoryId: categoryId),
    );
    return response;
  }
}
