import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/network/models/login/login_response.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(AppConstants.graphql)
  Future<LoginResponse> login(@Body() Map<String, dynamic> mutation);
  @GET(AppConstants.profile)
  Future<UserRoleModel> userRole();
}
