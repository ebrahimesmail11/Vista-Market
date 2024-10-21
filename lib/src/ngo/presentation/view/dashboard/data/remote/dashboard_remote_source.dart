import 'package:vista_market/src/common/network/models/categories/categories_response.dart';
import 'package:vista_market/src/common/network/models/products/products_response.dart';
import 'package:vista_market/src/common/network/models/users/users_response.dart';
import 'package:vista_market/src/common/network/service/graphql/admin/dashboard_quries.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';

class DashboardRemoteSource {
  const DashboardRemoteSource(this._apiService);
  final ApiService _apiService;

  Future<ProductsResponse> numberOfProducts() async {
    final response = await _apiService
        .numberOfProducts(DashboardQuries().numberOfProductsMapQuery());

    return response;
  }

  Future<CategoriesResponse> numberOfCategories() async {
    final response = await _apiService
        .numberOfCategories(DashboardQuries().numberOfCategoriesMapQuery());

    return response;
  }

  Future<UsersResponse> numberOfUsers() async {
    final response = await _apiService
        .numberOfUsers(DashboardQuries().numberOfUsersMapQuery());

    return response;
  }
}
