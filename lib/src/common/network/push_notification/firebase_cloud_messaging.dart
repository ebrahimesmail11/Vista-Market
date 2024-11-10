import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() {
    // قم بإنشاء الـ instance عند الحاجة فقط
    return _instance ??= FirebaseCloudMessaging._();
  }

  // ignore: unused_element
  FirebaseCloudMessaging._();
  static FirebaseCloudMessaging? _instance;

  Future<String> accessToken() async {
    // final serviceAccountJson = jsonDecode(dotenv.env['SERVICE_ACCOUNT_JSON']!);
    final serviceAccountJson = {
      'type': dotenv.env['TYPE'],
      'project_id': dotenv.env['PROJECT_ID'],
      'private_key_id': dotenv.env['PRIVATE_KEY_ID'],
      'private_key':dotenv.env['PRIVATE_KEY']?.replaceAll(r'\n', '\n'),
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

  Future<void> sendNotification() async {
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
            'token':
                'c1POQpMHQ5KqC5WAx0G9Sw:APA91bFySMYFvEHsSwFyuIDQm_PJZQkg9QVj61ONALsgDm7CGYzwbTi6026fmVMZpj6sv7m67Kfx_e7ebc4giw0Xx4vtlJM5X0E5_DJME_xEb9wa95yyzwM',
            'notification': {
              'title': 'Vista Market',
              'body': 'New update from Vista Market',
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
