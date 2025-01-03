import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/admin_widget/admin_app_bar_widget.dart';
import 'package:vista_market/src/ngo/presentation/cubit/categories_number/categories_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/products_number/products_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/users_number/users_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/widget/dashboard_body/dash_board_body.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ProductsNumberCubit>()..getNumberOfProducts(context),
        ),
        BlocProvider(
          create: (context) =>
              getIt<CategoriesNumberCubit>()..getNumberOfCategories(context),
        ),
        BlocProvider(
          create: (context) =>
              getIt<UsersNumberCubit>()..getNumberOfUsers(context),
        ),
      ],
      child: Scaffold(
        backgroundColor: context.colors.mainColor,
        appBar: AdminAppBarWidget(
          isMain: true,
          backgroundColor: context.colors.mainColor!,
          title: context.tr.dashboard,
        ),
        body: const DashBoardBody(),
      ),
    );
  }
}
