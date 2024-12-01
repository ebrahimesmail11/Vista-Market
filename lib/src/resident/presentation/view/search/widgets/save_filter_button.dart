import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/custom_linear_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class SaveFilterButton extends StatelessWidget {
  const SaveFilterButton({required this.onPressed, super.key});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 300,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: CustomLinearButton(
          onPressed: onPressed,
          height: 30.h,
          width: 100.w,
          child: TextApp(
            text: context.tr.save,
            theme: context.displaySmall!.copyWith(
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
