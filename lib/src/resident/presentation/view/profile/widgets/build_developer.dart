import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildDeveloper,
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
        InkWell(
          onTap: () {
            context.pushNamed(Routes.webView,
                arguments: dotenv.env['BUILD_DEV'] ,);
          },
          child: Row(
            children: [
              TextApp(
                text: 'Vista Market',
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
