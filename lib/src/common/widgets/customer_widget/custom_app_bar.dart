import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_linear_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.title ,super.key});
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.mainColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomLinearButton(
            onPressed: () {
              context.pop();
            },
            child: Center(
              child: SvgPicture.asset(
                AppImages.backButton,
              ),
            ),
          ),
          Flexible(
            child: TextApp(
              text: title,
              theme: context.displaySmall!.copyWith(
                color: context.colors.textColor,
                fontSize: 20.h,
                fontWeight: TextStyles.bold,
                fontFamily: TextStyles.poppinsEnglish,
              ),
            ),
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
