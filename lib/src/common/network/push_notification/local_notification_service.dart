import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/routing/routes.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static Future<void> onTap(NotificationResponse notificationResponse) async {
    final payloadValue = int.tryParse(notificationResponse.payload ?? '');
    if (payloadValue == null || payloadValue == -1) return;

    //  if (int.parse(notificationResponse.payload.toString()) == -1) return;
    log('response=====> ${notificationResponse.payload}');
    await getIt<GlobalKey<NavigatorState>>().currentState!.pushNamed(
          Routes.productDetails,
          arguments: payloadValue,
        );
    log('response=====> ${notificationResponse.payload}');
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'visita-market-id',
        'Visita Market ',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
