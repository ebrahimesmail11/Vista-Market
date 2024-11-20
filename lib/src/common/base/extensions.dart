import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vista_market/src/common/generated/app_localizations.dart';
import 'package:vista_market/src/utils/theme/assets_extensions.dart';
import 'package:vista_market/src/utils/theme/colors_extensions.dart';

extension Navigation on BuildContext {
  //Colors
  MyColors get colors => Theme.of(this).extension<MyColors>()!;

  //Images
  MyAssets get images => Theme.of(this).extension<MyAssets>()!;

  //Localization

  AppLocalizations get tr => AppLocalizations.of(this);
// Localizations.localeOf(context)
  Locale get currentLocale => Localizations.localeOf(this);
bool get isEnlocale => currentLocale.languageCode == 'en';

  //Navigation
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// shortcut for `Theme.of(context).textTheme.bodySmall`
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  /// shortcut for `Theme.of(context).textTheme.bodyMedium`
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  /// shortcut for `Theme.of(context).textTheme.bodyLarge`
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  /// shortcut for `Theme.of(context).textTheme.labelSmall`
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  /// shortcut for `Theme.of(context).textTheme.labelMedium`
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  /// shortcut for `Theme.of(context).textTheme.labelLarge`
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  /// shortcut for `Theme.of(context)..textTheme.headline1`
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  /// shortcut for `Theme.of(context)..textTheme.headline1`
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  /// shortcut for `Theme.of(context)..textTheme.headline1`
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  /// shortcut for `Theme.of(context).textTheme.headlineSmall`
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  /// shortcut for `Theme.of(context).textTheme.headlineMedium`
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  /// shortcut for `Theme.of(context).textTheme.headlineLarge`
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  /// shortcut for `Theme.of(context).textTheme.titleSmall`
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  /// shortcut for `Theme.of(context).textTheme.titleMedium`
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  /// shortcut for `Theme.of(context).textTheme.titleLarge`
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
     Object? arguments,
     RoutePredicate? predicate,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate!, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
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

extension StringFormatting on String {
  String imageProductFormat() {
    return replaceAll(RegExp(r'^\["?|"\]?|"$'), '');
  }

  String toCapitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension DataEx on DateTime {
  String getFormatDayMonth() {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
