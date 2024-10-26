import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/network/models/all_category/get_all_categories_response.dart';
import 'package:vista_market/src/common/network/models/categories/categories_response.dart';
import 'package:vista_market/src/common/network/models/create_category/create_category_response.dart';
import 'package:vista_market/src/common/network/models/login/login_response.dart';
import 'package:vista_market/src/common/network/models/products/products_response.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/common/network/models/registration/registration_response.dart';
import 'package:vista_market/src/common/network/models/upload_image/upload_image_picker_model.dart';
import 'package:vista_market/src/common/network/models/users/users_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(AppConstants.graphql)
  Future<LoginResponse> login(@Body() Map<String, dynamic> mutation);
  @GET(AppConstants.profile)
  Future<UserRoleModel> userRole();
  @POST(AppConstants.uploadImage)
  Future<UploadImagePickerModel> uploadImage(@Body() FormData file);
  @POST(AppConstants.graphql)
  Future<RegistrationResponse> registration(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(AppConstants.graphql)
  Future<ProductsResponse> numberOfProducts(
    @Body() Map<String, dynamic> query,
  );
  @POST(AppConstants.graphql)
  Future<CategoriesResponse> numberOfCategories(
    @Body() Map<String, dynamic> query,
  );
  @POST(AppConstants.graphql)
  Future<UsersResponse> numberOfUsers(
    @Body() Map<String, dynamic> query,
  );
  @POST(AppConstants.graphql)
  Future<GetAllCategoriesResponse> getAllCategories(
    @Body() Map<String, dynamic> query,
  );
  @POST(AppConstants.graphql)
  Future<CreateCategoryResponse> createCategory(
    @Body() Map<String, dynamic> mutation,
  );
}
