import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/network/push_notification/local_notification_service.dart';
import 'package:vista_market/src/common/routing/routes.dart';

class FirebaseMessagingNavigate {
  //forground
  static Future<void> forGroundMessage(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotificationService.showNotification(
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        payload: message.data['productId'].toString(),
      );
    }
  }

  //background
  static Future<void> backGroundMessage(RemoteMessage? message) async {
    if (message != null) {
      _navigate(message);
    }
  }

  //terminated
  static Future<void> terminatedMessage(RemoteMessage? message) async {
    if (message != null) {
      _navigate(message);
    }
  }

  static void _navigate(RemoteMessage message) {
    if (int.parse(message.data['productId'].toString()) == -1) return;
    getIt<GlobalKey<NavigatorState>>().currentState!.pushNamed(
          Routes.productDetails,
          arguments: int.parse(message.data['productId'].toString()),
        );
  }
}
