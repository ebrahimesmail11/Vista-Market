import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/admin_widget/admin_app_bar_widget.dart';
import 'package:vista_market/src/ngo/presentation/cubit/create_add_category/create_add_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_categories/get_all_categories_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/widget/categories_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
         create: (context) =>getIt<GetAllCategoriesCubit>()
        ..getAllCategories(context),
        ),
        BlocProvider(create: (context) => getIt<CreateAddCategoryCubit>(),
        ),
      ],
      
      child: Scaffold(
        backgroundColor: context.colors.mainColor,
        appBar: AdminAppBarWidget(
          isMain: true,
          backgroundColor: context.colors.mainColor!,
          title: 'Categories',
        ),
        body: const CategoriesBody(),
      ),
    );
  }
}
