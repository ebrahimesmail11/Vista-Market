import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/build_developer.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/build_version.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/dark_mode_change.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/language_change.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/logout_widget.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/notification_change.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/section_user_profile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  SectionUserProfile(),
            20.verticalSpace,
            CustomFadeInRight(
              duration: 400,
              child: TextApp(
                text: context.tr.application_features,
                theme: context.displaySmall!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: TextStyles.bold,
                ),
              ),
            ),
            30.verticalSpace,
            const CustomFadeInRight(
              duration: 400,
              child: LanguageChange(),
            ),
            20.verticalSpace,
            const CustomFadeInRight(
              duration: 400,
              child: DarkModeChange(),
            ),
            20.verticalSpace,
            const CustomFadeInRight(
              duration: 400,
              child: BuildDeveloper(),
            ),
            20.verticalSpace,
            const CustomFadeInRight(
              duration: 400,
              child: NotificationChange(),
            ),
             20.verticalSpace,
            const CustomFadeInRight(
              duration: 400,
              child: BuildVersion(),
            ),
              20.verticalSpace,
            const CustomFadeInRight(
              duration: 400,
              child: LogoutWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
