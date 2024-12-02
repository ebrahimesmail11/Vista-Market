import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/admin_widget/empty_screen.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_product_item.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_search/get_search_products_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/search/widgets/filters_buttons.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          const FiltersButtons(),
          BlocBuilder<GetSearchProductsCubit, GetSearchProductsState>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  return const SizedBox.shrink();
                },
                loading: () {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.colors.textColor,
                      ),
                    ),
                  );
                },
                success: (productsList) {
                  return Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 15,
                        childAspectRatio: 165 / 250,
                      ),
                      itemCount: productsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CustomProductItem(
                          imageUrl: productsList[index].images?[0] ?? '',
                          title: productsList[index].title ?? '',
                          categoryName:
                              productsList[index].category?.name ?? '',
                          price: productsList[index].price ?? 0,
                          productId:
                              int.tryParse(productsList[index].id ?? '') ?? 0,
                        );
                      },
                    ),
                  );
                },
                empty: EmptyScreen.new,
                failure: Text.new,
              );
            },
          ),
        ],
      ),
    );
  }
}
