import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/customer/notifications/notifications_model.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/resident/presentation/view/notification/controller/notification_controller.dart';

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
      child: StreamBuilder<List<NotificationsModel>>(
        stream: NotificationController().getNoyificationList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }
          final numberNotificaton =
              snapshot.data!.where((e) => e.isSeen == false).length;
          return badge.Badge(
            showBadge: numberNotificaton!=0,
            badgeAnimation: const badge.BadgeAnimation.scale(),
           position: badge.BadgePosition.topEnd(end: -4.w, top: -8.h),
            badgeContent: TextApp(
              text:
                  numberNotificaton >= 9 ? '+9' : numberNotificaton.toString(),
              theme: context.displaySmall!.copyWith(
                fontSize: 11.sp,
                color: context.colors.textColor,
                fontWeight: TextStyles.bold,
              ),
              textAlign: TextAlign.center,
            ),
            badgeStyle: badge.BadgeStyle(
              badgeColor: Colors.pink,
              padding: EdgeInsets.all(5.h),
              elevation: 0,
            ),
            child: SvgPicture.asset(
              AppImages.notificationIcon,
              height: 25.h,
              color:
                  isSelected ? context.colors.navBarSelectedTab : Colors.grey,
            ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
          );
        },
      ),
    );
  }
}
