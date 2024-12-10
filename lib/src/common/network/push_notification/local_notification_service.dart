import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

  static Future<void> onTap(NotificationResponse notificationResponse) async {}
  static Future<void> showNotification() async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'visita-market-id',
        'Visita Market',
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
      'title',
      'body',
      notificationDetails,
    );
  }
}
