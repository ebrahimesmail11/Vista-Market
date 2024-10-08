import 'package:flutter/material.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';

class TextStyles {
  // font family
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';
  static String getLocatedFontFamily() {
    final getCurrentLanguage = SharedPref().getString(PrefKeys.languageKey);
    if (getCurrentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }

  // font weight
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;

// font size
  static TextStyle defaultStyleLight = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontFamily: getLocatedFontFamily(),
  );
  static TextStyle defaultStyleLDark = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: getLocatedFontFamily(),
  );
}
