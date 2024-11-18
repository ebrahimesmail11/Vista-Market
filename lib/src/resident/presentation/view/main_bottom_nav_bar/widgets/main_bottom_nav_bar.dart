import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/nav_bar_enum.dart';
import 'package:vista_market/src/resident/presentation/cubit/main_nav_bar/main_cubit_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/main_bottom_nav_bar/widgets/icon_tab_nav_bar.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 80.h,
          width: double.infinity,
          child: Stack(
            children: [
              15.verticalSpace,
              Container(
                margin: const EdgeInsets.all(8),
                height: 80.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colors.navBarbg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 90.h,
                    width: 300.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: BlocBuilder<MainCubitCubit, MainCubitState>(
                        builder: (context, state) {
                          final cubit = context.read<MainCubitCubit>();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconTabNavBar(
                                onTap: () {
                                  cubit.barSelectedIcon(NavBarEnum.home);
                                },
                                icon: AppImages.homeTab,
                                isSelected: cubit.navBarEnum == NavBarEnum.home,
                              ),
                              IconTabNavBar(
                                onTap: () {
                                  cubit.barSelectedIcon(NavBarEnum.categories);
                                },
                                icon: AppImages.categoriesTab,
                                isSelected:
                                    cubit.navBarEnum == NavBarEnum.categories,
                              ),
                              IconTabNavBar(
                                onTap: () {
                                  cubit.barSelectedIcon(NavBarEnum.favorites);
                                },
                                icon: AppImages.favouritesTab,
                                isSelected:
                                    cubit.navBarEnum == NavBarEnum.favorites,
                              ),
                              IconTabNavBar(
                                onTap: () {
                                  cubit.barSelectedIcon(NavBarEnum.profile);
                                },
                                icon: AppImages.profileTab,
                                isSelected:
                                    cubit.navBarEnum == NavBarEnum.profile,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -12,
                left: -8,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(context.images.bigNavBar!),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 17,
                child: SvgPicture.asset(
                  AppImages.carShop,
                  color: Colors.white,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
