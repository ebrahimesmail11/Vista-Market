import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/resident/presentation/cubit/cubit/share_cubit_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_banners/get_banners_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_categories_customer/get_categories_customer_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_products/get_products_customer_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/home_body.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollUp() {
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetBannersCubit>()..getBanners(context),
        ),
        BlocProvider(
          create: (context) => getIt<GetCategoriesCustomerCubit>()
            ..getAllCategoriesCustomer(context),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GetProductsCustomerCubit>()..getProductsCustomer(context),
        ),
        BlocProvider(create: (context) => getIt<FavoritesCubit>()),
        BlocProvider(create: (context) => getIt<ShareCubitCubit>()),
      ],
      child: Stack(
        children: [
          HomeBody(
            scrollController: scrollController,
          ),
          CustomFadeInLeft(
            duration: 400,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: FloatingActionButton(
                  backgroundColor: context.colors.bluePinkLight,
                  onPressed: scrollUp,
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
