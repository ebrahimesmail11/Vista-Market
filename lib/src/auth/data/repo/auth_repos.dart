import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/network/models/login/login_request_body.dart';
import 'package:vista_market/src/common/network/models/login/login_response.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/auth/data/remote/auth_remote_source.dart';

class AuthRepos {
  AuthRepos(this._remoteSource);

  final AuthRemoteSource _remoteSource;

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _remoteSource.login(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const  ApiResult.error(AppConstants.errorMsg);
    }
  }
  Future<UserRoleModel> userRole(String token) async {
      final response =await _remoteSource.userRole(token);
      return response;

  }
}
