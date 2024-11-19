import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/resident/presentation/cubit/profile_user/profile_user_cubit.dart';
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
          children: [
            BlocBuilder<ProfileUserCubit, ProfileUserState>(
              builder: (context, state) {
                return state.when(
                  loading: UserProfileShimmer.new,
                  success: (user) => UserProfileInfo(userModel: user),
                  failure: Text.new,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
