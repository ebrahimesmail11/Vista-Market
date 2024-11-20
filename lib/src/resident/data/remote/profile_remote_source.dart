import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';

class ProfileRemoteSource {
  Future<UserRoleModel> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client= ApiService(dio);
    final resonse = await client.userRole();
    debugPrint('User Role=> ${resonse.userRole}');
    return resonse;
  }
}
