import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/admin_widget/admin_app_bar_widget.dart';
import 'package:vista_market/src/ngo/presentation/cubit/delete_users/delete_users_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_users/get_all_users_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/users/widgets/user_admin_body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAllUsersCubit>()
            ..getAllUsers(context, isNotLoading: true),
        ),
        BlocProvider(create: (context) => getIt<DeleteUsersCubit>()),
      ],
      child: Scaffold(
        backgroundColor: context.colors.mainColor,
        appBar: AdminAppBarWidget(
          isMain: true,
          backgroundColor: context.colors.mainColor!,
          title: 'Users',
        ),
        body: const UserAdminBody(),
      ),
    );
  }
}
