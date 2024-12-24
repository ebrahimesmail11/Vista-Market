import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/base/app_value.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/customer/notifications/notifications_model.dart';
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

  Future<void> addNotificationToAllUsersFirebase({
    required String body,
    required String title,
    required int productId,
  }) async {
    const createdAt = '';
    final notificationId = AppValue.randomStringId;
    final users = FirebaseFirestore.instance.collection(
      AppConstants.userCollectionDataBase,
    );
    final usersGet = await users.get();
    for (final doc in usersGet.docs) {
      try {
        await users
            .doc(doc.id)
            .collection(AppConstants.notificationCollection)
            .doc(notificationId)
            .set(
              NotificationsModel(
                body: body,
                notificationId: notificationId,
                title: title,
                productId: productId,
                isSeen: false,
                createdAt: createdAt.convertDataFormate(),
              ).toJson(),
            );
        log('Notification added for user: ${doc.id}');
      } catch (e) {
        log('Error adding notification for user ${doc.id}: $e');
      }
    }
  }
}
