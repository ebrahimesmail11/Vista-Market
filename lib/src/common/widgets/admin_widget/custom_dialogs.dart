import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class CustomDialogs {
  const CustomDialogs._();

  static void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
            child: Center(
              child: TextApp(
                text: textBody,
                theme: context.displaySmall!.copyWith(
                  fontSize: 18.sp,
                  color: context.colors.textColor,
                  fontWeight: TextStyles.medium,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          actions: [
            CustomButton(
              backgroundColor: context.colors.bluePinkDark,
                onPressed: onPressed,
                text: textButton1,
                width: 320.w,
                height: 45.h,
                isLoading: isLoading,
                lastRadius: 10,
                threeRadius: 10,
                ),
                SizedBox(height: 10.h, width: 1.w,),
                CustomButton(
                onPressed: (){
                  context.pop();
                },
                text: textButton2,
                width: 320.w,
                height: 45.h,
                isLoading: isLoading,
                lastRadius: 10,
                threeRadius: 10,
                ),
          ],
        );
      },
    );
  }
}
