import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {required this.title,
      required this.body,
      required this.createdAt,
      required this.onTap,
      required this.isSeen,
      required this.onPressedRemoved,
      super.key,});
  final VoidCallback onTap;
  final VoidCallback onPressedRemoved;
  final String title;
  final String body;
final bool isSeen;
  final String createdAt;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      onTap: onTap,
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
        text: title,
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
            text: body,
            theme: context.displaySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: TextStyles.regular,
              color: context.colors.textColor,
            ),
          ),
          5.verticalSpace,
          TextApp(
            text: createdAt,
            theme: context.displaySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: TextStyles.regular,
              color: context.colors.textColor,
            ),
          ),
          5.verticalSpace,
           Divider(
            color:isSeen? Colors.grey: Colors.white,
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onPressedRemoved,
        icon: Icon(
          Icons.close,
          color: Colors.yellow,
          size: 20.sp,
        ),
      ),
    );
  }
}
