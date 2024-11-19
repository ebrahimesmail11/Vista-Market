import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/common/storage/local_storage_helper.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/resident/data/remote/profile_remote_source.dart';

class ProfileRepo {
  ProfileRepo(this._remoteSource);
  final ProfileRemoteSource _remoteSource;

  Future<ApiResult<UserRoleModel>> profileUser(BuildContext context) async {
     final token = await LocalStorageHelper.read(PrefKeys.tokenKey);
    if (token == null || token.isEmpty) {
    return const ApiResult.error('Token is missing or expired');
  }

    try {
      final result = await _remoteSource.profileUser();
      return ApiResult.success(result);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      } else {
        return const ApiResult.error('An unexpected error occurred');
      }
    }
  }
}
