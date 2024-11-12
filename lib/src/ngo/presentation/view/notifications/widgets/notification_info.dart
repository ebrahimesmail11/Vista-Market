import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({
    required this.title,
    required this.body,
    super.key,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          theme: context.displaySmall!.copyWith(
            fontSize: 14.sp,
            fontWeight: TextStyles.bold,
            color: context.colors.textColor,
          ),
        ),
        8.verticalSpace,
        Flexible(
          child: TextApp(
          text: body,
          theme: context.displaySmall!.copyWith(
            fontSize: 14.sp,
            fontWeight: TextStyles.bold,
            color: context.colors.bluePinkLight,
          ),
        ),
        ),
      ],
    );
  }
}
