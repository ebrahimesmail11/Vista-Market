import 'package:vista_market/src/common/network/models/all_category/get_all_categories_response.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/models/customer/banners/banners_response.dart';
import 'package:vista_market/src/common/network/service/graphql/admin/categories_quires.dart';
import 'package:vista_market/src/common/network/service/graphql/admin/products_quires.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/customer/home_quires.dart';

class HomeRemoteSource {
  HomeRemoteSource(this._apiService);
  final ApiService _apiService;
  Future<BannersResponse> getBanners() async {
    final response = await _apiService.getBanners(HomeQuires().getBanners());

    return response;
  }
  
  Future<GetAllCategoriesResponse> getAllCategoriesCustomer() async {
    final response = await _apiService
        .getAllCategories(CategoriesQuires().getAllCategories());
    return response;
  }
    Future<AllProductsResponse> getAllProductsCustomer() async {
    final response = await _apiService.getAllProducts(
      ProductsQuires().getAllProductsMapQuery(),
    );
    return response;
  }
}
