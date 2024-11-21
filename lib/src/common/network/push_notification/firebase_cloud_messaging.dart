import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() {
    // قم بإنشاء الـ instance عند الحاجة فقط
    return _instance ??= FirebaseCloudMessaging._();
  }

  // ignore: unused_element
  FirebaseCloudMessaging._();
  static FirebaseCloudMessaging? _instance;
  static String subscribeKey = 'visita-market';
  final _firebaseMessaging = FirebaseMessaging.instance;
  bool isPremissionNotification = false;
  ValueNotifier<bool> isNotificationScribed = ValueNotifier(true);

  Future<void> init() async {
    await _premissionNotification();
  }

  Future<void> controllerForUserSubscribeNotification(
    BuildContext context,
  ) async {
    if (isPremissionNotification == false) {
      await _premissionNotification();
    } else {
      if (isNotificationScribed.value == false) {
        await _subscribeNotification();

        if (!context.mounted) return;
        MotionToast.success(
            animationDuration: const Duration(seconds: 2),
            description: Text(
              context.tr.subscribed_to_notifications,
              style: context.displayMedium!.copyWith(
                fontSize: 14.sp,
                color: context.colors.textColor, 
              ),
            ),
          ).show(context);
      } else {
        await _unSubscribeNotification();
         if (!context.mounted) return;
          MotionToast.success(
            animationDuration: const Duration(seconds: 2),
            description: Text(
              context.tr.unsubscribed_to_notifications,
               style: context.displayMedium!.copyWith(
                fontSize: 14.sp,
                color: context.colors.textColor, 
              ),
            ),
          ).show(context);
      }
    }
  }

  Future<void> _premissionNotification() async {
    final settings = await _firebaseMessaging.requestPermission(
      badge: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      isPremissionNotification = true;
      await _subscribeNotification();
    } else {
      isPremissionNotification = false;
      isNotificationScribed.value = false;
    }
  }

  Future<void> _subscribeNotification() async {
    isNotificationScribed.value = true;
    await _firebaseMessaging.subscribeToTopic(subscribeKey);
    debugPrint('====🔔 Notification Subscribed 🔔=====');
  }

  Future<void> _unSubscribeNotification() async {
    isNotificationScribed.value = false;
    await _firebaseMessaging.unsubscribeFromTopic(subscribeKey);
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }

  Future<String> accessToken() async {
    final serviceAccountJson = {
      'type': dotenv.env['TYPE'],
      'project_id': dotenv.env['PROJECT_ID'],
      'private_key_id': dotenv.env['PRIVATE_KEY_ID'],
      'private_key': dotenv.env['PRIVATE_KEY']?.replaceAll(r'\n', '\n'),
      'client_email': dotenv.env['CLIENT_EMAIL'],
      'client_id': dotenv.env['CLIENT_ID'],
      'auth_uri': dotenv.env['AUTH_URI'],
      'token_uri': dotenv.env['TOKEN_URI'],
      'auth_provider_x509_cert_url': dotenv.env['AUTH_PROVIDER_X509_CERT_URL'],
      'client_x509_cert_url': dotenv.env['CLIENT_X509_CERT_URL'],
      'universe_domain': dotenv.env['UNIVERSE_DOMAIN'],
    };

    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final http.Client client = await clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    final credentials = await obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();
    log('Access Token: ${credentials.accessToken.data}');
    return credentials.accessToken.data;
  }

  Future<void> sendNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final response = await Dio().post<dynamic>(
        'https://fcm.googleapis.com/v1/projects/vista-market/messages:send',
        options: Options(
          contentType: 'application/json',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${await accessToken()}',
          },
        ),
        data: {
          'message': {
            'topic': subscribeKey,
            'notification': {
              'title': title,
              'body': body,
            },
            'data': {
              'productId': productId.toString(),
            },
          },
        },
      );

      debugPrint('Notification Created => ${response.data}');
    } catch (e) {
      debugPrint('Notification Error => $e');
    }
  }
}
