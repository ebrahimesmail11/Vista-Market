import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/network/models/login/login_request_body.dart';
import 'package:vista_market/src/common/network/models/login/login_response.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/common/network/models/registration/registration_request_body.dart';
import 'package:vista_market/src/common/network/models/registration/registration_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/graphql_queries.dart/auth_queries.dart';

class AuthRemoteSource {
  AuthRemoteSource(this._graphqlApi);

  final ApiService _graphqlApi;
  Future<LoginResponse> login({required LoginRequestBody body}) async {
    final response = await _graphqlApi.login(
      AuthQueries().loginMapQuery(body: body),
    );
    return response;
  }

  Future<UserRoleModel> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final resonse = await client.userRole();
    debugPrint('User Role=> ${resonse.userRole}');
    return resonse;
  }

  Future<RegistrationResponse> registration({
    required RegistrationRequestBody body,
  }) async {
    final response = _graphqlApi.registration(
      AuthQueries().registrationMapQuery(body: body),
    );
    return response;
  }

  Future<void> addUserIdNotification({required String userId}) async {
    await FirebaseFirestore.instance
        .collection(AppConstants.userCollectionDataBase)
        .doc(userId)
        .set({});
  }
}
