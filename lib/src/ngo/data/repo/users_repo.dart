import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/all_users/all_users_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/ngo/data/remote/users_remote_source.dart';

class UsersRepo {
  UsersRepo(this._remoteSource);
  final UsersRemoteSource _remoteSource;
  Future<ApiResult<AllUsersResponse>> getAllUsers(BuildContext context) async {
    try {
      final response = await _remoteSource.getAllUsers();
      return ApiResult.success(response);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      } else {
        return const ApiResult.error('An unexpected error occurred');
      }
    }
  }
}
