import 'package:flutter/material.dart';
import 'package:vista_market/src/utils/colors/app_colors_dark.dart';
import 'package:vista_market/src/utils/colors/app_colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.bluePinkDark,
    required this.bluePinkLight,
    required this.textColor,
    required this.textFormBorder,
    required this.navBarbg,
    required this.navBarSelectedTab,
    required this.containerShadow1,
    required this.containerShadow2,
    required this.containerLinear1,
    required this.containerLinear2,
    required this.mainColor,
  });
  final Color? mainColor;
  final Color? bluePinkDark;
  final Color? bluePinkLight;
  final Color? textColor;
  final Color? textFormBorder;
  final Color? navBarbg;
  final Color? navBarSelectedTab;
  final Color? containerShadow1;
  final Color? containerShadow2;
  final Color? containerLinear1;
  final Color? containerLinear2;
  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? bluePinkDark,
    Color? bluePinkLight,
    Color? textColor,
    Color? textFormBorder,
    Color? navBarbg,
    Color? navBarSelectedTab,
    Color? containerShadow1,
    Color? containerShadow2,
    Color? containerLinear1,
    Color? containerLinear2,
  }) {
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
    );
  }

  static const MyColors dark = MyColors(
     mainColor: AppColorsDark.mainColor,
    bluePinkDark: AppColorsDark.blueDark,
    bluePinkLight: AppColorsDark.blueLight,
    textColor: AppColorsDark.white,
    textFormBorder: AppColorsDark.blueLight,
    navBarbg: AppColorsDark.navBarDark,
    navBarSelectedTab: AppColorsDark.white,
    containerShadow1: AppColorsDark.black1,
    containerShadow2: AppColorsDark.black2,
    containerLinear1: AppColorsDark.black1,
    containerLinear2: AppColorsDark.black2,
  );

  static const MyColors light = MyColors(
       mainColor: AppColorsLight.mainColor,
    bluePinkDark: AppColorsLight.pinkDark,
    bluePinkLight: AppColorsLight.pinkLight,
    textColor: AppColorsLight.black,
    textFormBorder: AppColorsLight.pinkLight,
    navBarbg: AppColorsLight.mainColor,
    navBarSelectedTab:AppColorsLight.pinkDark,
    containerShadow1:AppColorsLight.white,
    containerShadow2: AppColorsLight.white,
    containerLinear1: AppColorsLight.pinkDark,
    containerLinear2:AppColorsLight.pinkLight,
  );
}
