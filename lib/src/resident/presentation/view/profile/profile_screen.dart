import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/resident/presentation/cubit/profile_user/profile_user_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/profile/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileUserCubit>()..profileUser(context),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: const ProfileBody(),
      ),
    );
  }
}
