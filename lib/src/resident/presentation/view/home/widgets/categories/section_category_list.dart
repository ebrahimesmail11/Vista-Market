import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_categories_customer/get_categories_customer_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/categories/categories_list.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/categories/categories_shimmer.dart';

class SectionCategoryList extends StatelessWidget {
  const SectionCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCustomerCubit, GetCategoriesCustomerState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return const CategoriesShimmer();
          },
          success: (categories) => CategoriesList(categories: categories),
          empty: () => const SizedBox.shrink(),
          failure: (message) {
            return Center(
              child: Text(message),
            );
          },
        );
      },
    );
  }
}