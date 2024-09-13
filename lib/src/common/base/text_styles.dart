import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  // font family
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  // font weight
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;

// font size
  static const TextStyle defaultStyle = TextStyle(
    fontSize: 16,
    fontWeight: bold,
    color: Colors.black,
    fontFamily: poppinsEnglish,
  );
}
