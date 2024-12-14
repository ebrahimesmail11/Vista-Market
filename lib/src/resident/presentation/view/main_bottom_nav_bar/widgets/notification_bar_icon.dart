import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class NotificationNavBar extends StatelessWidget {
  const NotificationNavBar({
    required this.onTap,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: badge.Badge(
        badgeAnimation: const badge.BadgeAnimation.scale(),
        position: badge.BadgePosition.topEnd(end: -4.w, top: -8.h),
        badgeContent: TextApp(
          text: '9',
          theme: context.displaySmall!.copyWith(
            fontSize: 11.sp,
            color: context.colors.textColor,
            fontWeight: TextStyles.bold,
          ),
          textAlign: TextAlign.center,
        ),
        badgeStyle:  badge.BadgeStyle(
          badgeColor:Colors.pink,
          padding: EdgeInsets.all(5.h),
          elevation: 0,
        ),
        child: SvgPicture.asset(
          AppImages.notificationIcon,
          height: 25.h,
          color: isSelected ? context.colors.navBarSelectedTab : Colors.grey,
        ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
      ),
    );
  }
}
