import 'package:hive_flutter/adapters.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;
  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();
  Box<AddNotificationModel>? notificationBox;

  Future<void> setUp() async {
    await Hive.initFlutter();
    Hive
      .registerAdapter(
        AddNotificationModelAdapter(),
      );
    notificationBox =
        await Hive.openBox<AddNotificationModel>('notification_Box');
  }
  Future<void> clearAllBox()  async {
    await notificationBox?.clear();
  }
}
