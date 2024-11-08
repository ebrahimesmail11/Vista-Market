import 'package:vista_market/src/common/network/models/all_users/all_users_response.dart';
import 'package:vista_market/src/common/network/service/graphql/admin/users_quires.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';

class UsersRemoteSource {
  UsersRemoteSource(this._apiService);
  final ApiService _apiService;
  Future<AllUsersResponse> getAllUsers() async {
    final response = await _apiService.getAllUsers(
      UsersQuires().getAllUsersMapQuery(),
    );
    return response;
  }
  Future<void> deleteUser({required String userId}) async {
    final response = await _apiService.deleteUser(
      UsersQuires().deleteUserMapQuery(userId: userId),
    );
    return response;
  }
}
