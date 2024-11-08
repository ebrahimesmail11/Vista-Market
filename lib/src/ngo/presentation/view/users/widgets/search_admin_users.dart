import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_users/get_all_users_cubit.dart';

class SearchAdminUsers extends StatefulWidget {
  const SearchAdminUsers({super.key});

  @override
  State<SearchAdminUsers> createState() => _SearchAdminUsersState();
}

class _SearchAdminUsersState extends State<SearchAdminUsers> {
  @override
  void dispose() {
    context.read<GetAllUsersCubit>().searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
      builder: (context, state) {
        final cubit = context.read<GetAllUsersCubit>();
        return CustomTextField(
          controller: cubit.searchController,
          hintText: 'Search Users',
          keyboardType: TextInputType.emailAddress,
          onChanged: (p0) {
            cubit.searchUsers(context, p0);
            return null;
          },
          suffixIcon: cubit.searchController.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () {
                    cubit.searchController.clear();
                    cubit.getAllUsers(
                      context,
                      isNotLoading: true,
                    );
                  },
                  icon: Icon(
                    Icons.clear,
                    color: context.colors.bluePinkLight,
                  ),
                ),
        );
      },
    );
  }
}
