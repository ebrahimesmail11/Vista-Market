import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({this.title = 'No Data', super.key});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Opacity(
        opacity: .6,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(AppImages.emptyScreen),
          TextApp(
            text: title!,
            theme: context.displaySmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: TextStyles.medium,
              color: context.colors.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],),
      ),
    );
  }
}
