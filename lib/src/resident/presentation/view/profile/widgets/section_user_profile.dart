
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/resident/presentation/cubit/profile_user/profile_user_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/user_profile_info.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/user_profile_shimmer.dart';

class SectionUserProfile extends StatelessWidget {
  const SectionUserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileUserCubit, ProfileUserState>(
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
    );
  }
}
