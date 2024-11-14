import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/ngo/data/remote/add_notification_remote_source.dart';

class NotificationRepo {
  NotificationRepo(this._remoteSource);
  final AddNotificationRemoteSource _remoteSource;
  Future<ApiResult<void>> sendNotificationsRemote(
    BuildContext context, {
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final response = await _remoteSource.sendNotificationsRemote(
        title: title,
        body: body,
        productId: productId,
      );
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
