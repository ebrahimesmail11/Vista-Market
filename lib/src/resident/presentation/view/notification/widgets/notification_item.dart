import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      onTap: () {},
      leading: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.notificationIcon,
            color: Colors.pink,
            height: 30.h,
          ),
        ),
      ),
      title: TextApp(
        text: 'Notification Title',
        theme: context.displaySmall!.copyWith(
          fontSize: 12.sp,
          fontWeight: TextStyles.bold,
          color: context.colors.textColor,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          5.verticalSpace,
          TextApp(
            text: 'Notification Description',
            theme: context.displaySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: TextStyles.regular,
              color: context.colors.textColor,
            ),
          ),
          5.verticalSpace,
          TextApp(
            text: 'Notification Description',
            theme: context.displaySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: TextStyles.regular,
              color: context.colors.textColor,
            ),
          ),
          5.verticalSpace,
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.close,
          color: Colors.yellow,
          size: 20.sp,
        ),
      ),
    );
  }
}
