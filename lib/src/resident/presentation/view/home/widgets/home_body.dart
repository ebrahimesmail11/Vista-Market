import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_banners/get_banners_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_categories_customer/get_categories_customer_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_products/get_products_customer_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/banners/section_banner_sliders.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/categories/section_category_list.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/products/products_list.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/products/products_shimmer.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.scrollController, super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<GetBannersCubit>().getBanners(context);
        if (!context.mounted) return;
        await context
            .read<GetCategoriesCustomerCubit>()
            .getAllCategoriesCustomer(context);
        if (!context.mounted) return;
        await context
            .read<GetProductsCustomerCubit>()
            .getProductsCustomer(context);
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverToBoxAdapter(
            child: SectionBannerSliders(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          const SliverToBoxAdapter(
            child: SectionCategoryList(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          SliverToBoxAdapter(
            child:
                BlocBuilder<GetProductsCustomerCubit, GetProductsCustomerState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const ProductsShimmer();
                  },
                  success: (productList) {
                    return ProductsList(
                      productsList: productList,
                    );
                  },
                  empty: () {
                    return const SizedBox.shrink();
                  },
                  failure: Text.new,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: BlocBuilder<GetProductsCustomerCubit,
                  GetProductsCustomerState>(
                builder: (context, state) {
                  if (context
                      .read<GetProductsCustomerCubit>()
                      .isProductListSmallerThan14) {
                    return CustomButton(
                      onPressed: () {
                        context.pushNamed(Routes.productsViewAllScreen);
                      },
                      text: context.tr.view_all,
                      textColor: context.colors.textColor,
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      lastRadius: 10.r,
                      threeRadius: 10.r,
                      backgroundColor: context.colors.bluePinkLight,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60.h,
            ),
          ),
        ],
      ),
    );
  }
}
