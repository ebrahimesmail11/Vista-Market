import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/push_notification/firebase_cloud_messaging.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class NotificationChange extends StatelessWidget {
  const NotificationChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.notificationIcon,
          color: context.colors.textColor,
        ),
        10.horizontalSpace,
        TextApp(
          text: context.tr.notifications,
          theme: context.displaySmall!.copyWith(
            fontSize: 18.sp,
            color: context.colors.textColor,
            fontWeight: TextStyles.regular,
          ),
        ),
        const Spacer(),
        ValueListenableBuilder(
          valueListenable: FirebaseCloudMessaging().isNotificationScribed,
          builder: (_, value, __) {
            return Transform.scale(
              scale: 0.75,
              child: Switch.adaptive(
                inactiveTrackColor: const Color(0xff262626),
                activeColor: Colors.green,
                value: value,
                onChanged: (p0)async {
                await  FirebaseCloudMessaging()
                      .controllerForUserSubscribeNotification(context);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
