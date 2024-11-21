import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/utils/app_info.dart';

class BuildVersion extends StatelessWidget {
  const BuildVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildVersion,
          color: context.colors.textColor,
        ),
        10.horizontalSpace,
        TextApp(
          text: context.tr.build_developer,
          theme: context.displaySmall!.copyWith(
            fontSize: 18.sp,
            color: context.colors.textColor,
            fontWeight: TextStyles.regular,
          ),
        ),
        const Spacer(),
        FutureBuilder<String>(
          future: AppInfo.getAppVersion(context),
          builder: (context, snapshot) {
            if (snapshot.hasData){
               return TextApp(
              text: snapshot.data.toString(),
              theme: context.displaySmall!.copyWith(
                fontSize: 16.sp,
                color: context.colors.textColor,
                fontWeight: TextStyles.regular,
              ),
            );
            }else{
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
