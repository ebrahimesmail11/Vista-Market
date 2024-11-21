import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_dialogs.dart';
import 'package:vista_market/src/common/widgets/app_logout.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.logout,
          color: context.colors.textColor,
        ),
        10.horizontalSpace,
        TextApp(
          text: context.tr.log_out,
          theme: context.displaySmall!.copyWith(
            fontSize: 18.sp,
            color: context.colors.textColor,
            fontWeight: TextStyles.regular,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
          CustomDialogs.twoButtonDialog(
            context: context,
            textBody: context.tr.log_out_from_app,
            textButton1: context.tr.yes,
            textButton2: context.tr.no,
            onPressed: (){
              AppLogout().logout();
            },
            isLoading: false,
            );
          },
          child: Row(
            children: [
              TextApp(
                text: context.tr.log_out,
                theme: context.displaySmall!.copyWith(
                  fontSize: 14.sp,
                  color: context.colors.textColor,
                  fontWeight: TextStyles.regular,
                ),
              ),
              5.horizontalSpace,
              Icon(
                Icons.arrow_forward_ios,
                color: context.colors.textColor,
                size: 15.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
