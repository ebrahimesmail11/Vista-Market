import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/network/models/customer/notifications/notifications_model.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';

class NotificationController {
  NotificationController();

  CollectionReference<Map<String, dynamic>> getNotificationCollection() {
    final userId = SharedPref().getInt(PrefKeys.userId).toString();
    return FirebaseFirestore.instance
        .collection(AppConstants.userCollectionDataBase)
        .doc(userId)
        .collection(AppConstants.notificationCollection);
  }

  Stream<List<NotificationsModel>> getNoyificationList() {
    final notificationDataBase = getNotificationCollection();

    return notificationDataBase.snapshots().map(
      (values) {
        return values.docs.map((doc) {
          final data = doc.data();
          return NotificationsModel.fromJson(data);
        }).toList();
      },
    );
  }
}
