import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/utils/colors/app_colors_dark.dart';
import 'package:vista_market/src/utils/colors/app_colors_light.dart';
import 'package:vista_market/src/utils/theme/assets_extensions.dart';
import 'package:vista_market/src/utils/theme/colors_extensions.dart';


ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: AppColorsDark.mainColor,
    useMaterial3: true,
    textTheme:  TextTheme(
      displaySmall: TextStyles.defaultStyleLDark,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.dark,
      MyAssets.dark,
    ],
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: AppColorsLight.mainColor,
    useMaterial3: true,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.light,
      MyAssets.light,
    ],
     textTheme:  TextTheme(
      displaySmall: TextStyles.defaultStyleLight,
    ),
  );
}
