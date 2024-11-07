import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/admin_widget/empty_screen.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_users/get_all_users_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/users/widgets/search_admin_users.dart';
import 'package:vista_market/src/ngo/presentation/view/users/widgets/table_admin_users.dart';

class UserAdminBody extends StatelessWidget {
  const UserAdminBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          const SearchAdminUsers(),
          20.verticalSpace,
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await context.read<GetAllUsersCubit>().getAllUsers(
                      isNotLoading: true,
                      context,
                    );
              },
              child: CustomScrollView(
                slivers: [
                   SliverToBoxAdapter(
                    child: BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          },
                          success: (users) {
                            return TableAdminUsers(usersList:users,);
                          },
                          failure: Text.new,
                          empty:  EmptyScreen.new,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 25.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
