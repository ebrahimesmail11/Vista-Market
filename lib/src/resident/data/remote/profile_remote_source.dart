import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/storage/local_storage_helper.dart';
import 'package:vista_market/src/localization/pref_keys.dart';

class ProfileRemoteSource {
  ProfileRemoteSource(this._apiService);
  final ApiService _apiService;
  Future<UserRoleModel> profileUser() async{
     final token = await LocalStorageHelper.read(PrefKeys.tokenKey);
     if (token == null || token.isEmpty) {
      throw Exception('Token not found or empty');
    }
    final response = await _apiService.getUserRole(token);
    return response;
  }
}
