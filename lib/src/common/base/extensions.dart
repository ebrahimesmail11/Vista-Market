import 'package:flutter/material.dart';
import 'package:vista_market/src/common/generated/app_localizations.dart';
import 'package:vista_market/src/utils/theme/colors_extensions.dart';
import 'package:vista_market/src/utils/theme/image_extensions.dart';



extension Navigation on BuildContext {

  //Colors
  MyColors get colors => Theme.of(this).extension<MyColors>()!;

  //Images
  MyAssets get images => Theme.of(this).extension<MyAssets>()!;

  
  //Localization

  AppLocalizations get tr => AppLocalizations.of(this);


  //Navigation
  Future<dynamic> pushNamed(String routeName, {required Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    required Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, arguments: arguments, predicate);
  }

  Future<dynamic> pushReplacementNamed(
    String routeName, {
    required Object? arguments,
  }) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
