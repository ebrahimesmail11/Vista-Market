import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_banners/get_banners_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_categories_customer/get_categories_customer_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/banners/section_banner_sliders.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/categories/section_category_list.dart';

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
        ],
      ),
    );
  }
}
