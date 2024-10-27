import 'package:vista_market/src/common/network/models/all_category/get_all_categories_response.dart';
import 'package:vista_market/src/common/network/models/create_category/create_category_request.dart';
import 'package:vista_market/src/common/network/models/create_category/create_category_response.dart';
import 'package:vista_market/src/common/network/service/graphql/admin/categories_quires.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';

class CategoriesRemoteSource {
  CategoriesRemoteSource(this._apiService);

  final ApiService _apiService;

  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response = await _apiService
        .getAllCategories(CategoriesQuires().getAllCategories());
    return response;
  }

  Future<CreateCategoryResponse> createAddCategory({
    required CreateCategoryRequest body,
  }) async {
    final response = await _apiService
        .createCategory(CategoriesQuires().createAddCategory(body: body));
    return response;
  }
  Future<void> deleteCategory({required String categoryId})async{
    final response =await _apiService.deleteCategory(
      CategoriesQuires().deleteCategoryMapQuery(categoryId: categoryId),);

    return response;
  }
}
