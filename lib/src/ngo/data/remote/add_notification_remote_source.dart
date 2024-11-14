import 'package:vista_market/src/common/network/push_notification/firebase_cloud_messaging.dart';

class AddNotificationRemoteSource {
  Future<void> sendNotificationsRemote({
    required String title,
    required String body,
    required int productId,
  }) async {
    final response = await FirebaseCloudMessaging().sendNotification(
      title: title,
      body: body,
      productId: productId,
    );
    return response;
  }
}
