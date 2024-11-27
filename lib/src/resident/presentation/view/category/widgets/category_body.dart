import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/admin_widget/empty_screen.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_product_item.dart';
import 'package:vista_market/src/common/widgets/loading_shimmer.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_category/get_category_cubit.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCubit, GetCategoryState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 15,
                childAspectRatio: 165 / 250,
              ),
              itemCount: 14,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return LoadingShimmer(
                  height: 250.h,
                  width: 165.w,
                );
              },
            );
          },
          success: (productList) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 15,
                childAspectRatio: 165 / 250,
              ),
              itemCount: productList.length,
              shrinkWrap: true, 
              itemBuilder: (context, index) {
                return CustomProductItem(
                  imageUrl: productList[index].images?[0] ?? '',
                  title: productList[index].title ?? '',
                  categoryName: productList[index].category?.name ?? '',
                  price: productList[index].price ?? 0,
                  productId: int.parse(productList[index].id ?? ''),
                );
              },
            );
          },
          empty: EmptyScreen.new,
          failure: (message) => Center(child: Text(message)),
        );
      },
    );
  }
}
