import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/auth/data/repo/auth_repo/auth_repos.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/presentation/cubit/categories_number/categories_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/presentation/cubit/products_number/products_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/presentation/cubit/users_number/users_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/presentation/widget/dashboard_body/dash_board_container.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: RefreshIndicator(
        onRefresh: () async {
          await context
              .read<ProductsNumberCubit>()
              .getNumberOfProducts(context);
          if (context.mounted) {
            await context
                .read<CategoriesNumberCubit>()
                .getNumberOfCategories(context);
          }
          if (context.mounted){
          await context.read<UsersNumberCubit>().getNumberOfUsers(context);

          }
        },
        child: ListView(
          children: [
            BlocBuilder<ProductsNumberCubit, ProductsNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashBoardContainer(
                      title: 'Products',
                      number: '',
                      image: AppImages.productsDrawer,
                      isLoading: true,
                    );
                  },
                  success: (productNumber) {
                    return DashBoardContainer(
                      title: 'Products',
                      number: productNumber,
                      image: AppImages.productsDrawer,
                      isLoading: false,
                    );
                  },
                  failure: (error) {
                    return TextApp(
                      text: error,
                      theme: context.titleMedium!
                          .copyWith(color: Colors.red, fontSize: 16.sp),
                    );
                  },
                );
              },
            ),
            20.verticalSpace,
            BlocBuilder<CategoriesNumberCubit, CategoriesNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashBoardContainer(
                      title: 'Categories',
                      number: '',
                      image: AppImages.categoriesDrawer,
                      isLoading: true,
                    );
                  },
                  success: (categoriesNumber) {
                    return DashBoardContainer(
                      title: 'Categories',
                      number: categoriesNumber,
                      image: AppImages.categoriesDrawer,
                      isLoading: false,
                    );
                  },
                  failure: (error) => TextApp(
                    text: error,
                    theme: context.titleMedium!
                        .copyWith(color: Colors.red, fontSize: 16.sp),
                  ),
                );
              },
            ),
            20.verticalSpace,
            BlocBuilder<UsersNumberCubit, UsersNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const DashBoardContainer(
                    title: 'Users',
                    number: '',
                    image: AppImages.usersDrawer,
                    isLoading: true,
                  ),
                  success: (userNumber) {
                    return DashBoardContainer(
                      title: 'Users',
                      number: userNumber,
                      image: AppImages.usersDrawer,
                      isLoading: false,
                    );
                  },
                  failure: (error) => TextApp(
                    text: error,
                    theme: context.titleMedium!
                        .copyWith(color: Colors.red, fontSize: 16.sp),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
