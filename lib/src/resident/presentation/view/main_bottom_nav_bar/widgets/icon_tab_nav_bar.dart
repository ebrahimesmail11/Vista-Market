import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class IconTabNavBar extends StatelessWidget {
  const IconTabNavBar({
    required this.onTap,
    required this.icon,
    required this.isSelected,
    super.key,});
  final VoidCallback onTap;
  final String icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        height: 25.h,
        color: isSelected ? context.colors.navBarSelectedTab : Colors.grey,
      ).animate(target: isSelected?1:0).scaleXY(end: 1.2),
    );
  }
}
