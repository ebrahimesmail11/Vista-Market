import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/resident/presentation/cubit/profile_user/profile_user_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/language_change.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/user_profile_info.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/user_profile_shimmer.dart';

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
            BlocBuilder<ProfileUserCubit, ProfileUserState>(
              builder: (context, state) {
                return state.when(
                  loading: UserProfileShimmer.new,
                  success: (user) => CustomFadeInRight(
                    duration: 400,
                    child: Center(
                      child: UserProfileInfo(
                        userModel: user,
                      ),
                    ),
                  ),
                  failure: Text.new,
                );
              },
            ),
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
            20.verticalSpace,
            const CustomFadeInRight(
              duration: 400,
              child: LanguageChange(),
            ),
          ],
        ),
      ),
    );
  }
}
