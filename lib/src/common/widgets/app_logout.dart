import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/network/hive/hive_database.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/storage/local_storage_helper.dart';
import 'package:vista_market/src/localization/pref_keys.dart';

class AppLogout {
  factory AppLogout() => _instance;
  AppLogout._();
  static final AppLogout _instance = AppLogout._();

  Future<void> logout() async {
    final context = getIt<GlobalKey<NavigatorState>>().currentState!.context;
    await Future.wait([
      LocalStorageHelper.delete(PrefKeys.userRole),
      LocalStorageHelper.delete(PrefKeys.userId),
      LocalStorageHelper.delete(PrefKeys.tokenKey),
      HiveDatabase().clearAllBox(),
    ]);
    if (!context.mounted) return;
    await context.pushNamedAndRemoveUntil(
      Routes.login,
      predicate: (route) => false,
    );
  }
}
