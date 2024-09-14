import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/app_images.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({required this.image});
  final String? image;
  @override
  ThemeExtension<MyAssets> copyWith({String? image}) {
    return MyAssets(image: image);
  }

  @override
  ThemeExtension<MyAssets> lerp(
      covariant ThemeExtension<MyAssets>? other, double t,) {
    if (other is! MyAssets) {
      return this;
    }
    return MyAssets(image: image);
  }

  static const MyAssets dark = MyAssets(
    image: AppImages.pageUnderConstruction,
  );

  static const MyAssets light = MyAssets(
    image: AppImages.pageUnderConstruction,
  );
}
