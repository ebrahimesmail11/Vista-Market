import 'package:flutter/material.dart';
import 'package:vista_market/src/auth/data/remote/registration/registration_remote_source.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/registration/registration_request_body.dart';
import 'package:vista_market/src/common/network/models/registration/registration_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';

class RegistrationRepos {
  RegistrationRepos(this._remoteSource);
  final RegistrationRemoteSource _remoteSource;

  Future<ApiResult<RegistrationResponse>> registration(
    RegistrationRequestBody body,
    BuildContext context,
  ) async {
    try {
      final response = await _remoteSource.registration(body: body);
      return ApiResult.success(response);
    } catch (e) {
     if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      }
      return const ApiResult.error('An unexpected error occurred.');
    }
  }
}
