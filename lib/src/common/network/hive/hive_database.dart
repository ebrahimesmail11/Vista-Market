import 'package:hive_flutter/adapters.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';
import 'package:vista_market/src/common/network/models/favorites/favorites_model.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;
  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();
  Box<AddNotificationModel>? notificationBox;
  Box<FavoritesModel>? favoritesBox;

  Future<void> setUp() async {
    await Hive.initFlutter();
    _registerAdapters();
    notificationBox =
        await Hive.openBox<AddNotificationModel>('notification_Box');
    favoritesBox = await Hive.openBox<FavoritesModel>('favorites_Box');
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter(AddNotificationModelAdapter())
      ..registerAdapter(FavoritesModelAdapter());
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
    await favoritesBox?.clear();
  }

  // Future<void> compactAllBoxes() async {
  //   // ضغط صندوق الإشعارات
  //   if (notificationBox != null) {
  //     await notificationBox!.compact();
  //   }

  //   // ضغط صندوق المفضلة
  //   if (favoritesBox != null) {
  //     await favoritesBox!.compact();
  //   }
  // }
}
