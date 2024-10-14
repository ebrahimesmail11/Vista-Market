
import 'package:vista_market/src/auth/data/remote/login/auth_remote_source.dart';
import 'package:vista_market/src/common/network/models/login/login_request_body.dart';
import 'package:vista_market/src/common/network/models/login/login_response.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';


class AuthRepos {
  AuthRepos(this._remoteSource);

  final AuthRemoteSource _remoteSource;

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body ) async {
    try {
      final response = await _remoteSource.login(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }

  Future<ApiResult<UserRoleModel>> userRole(String token) async {
    try {
      final response = await _remoteSource.userRole(token);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
