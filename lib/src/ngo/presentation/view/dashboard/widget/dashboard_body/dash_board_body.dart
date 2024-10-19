import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/widget/dashboard_body/dash_board_container.dart';


class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children:  [
           const  DashBoardContainer(
              title: 'Products',
              number: '100',
              image: AppImages.productsDrawer, isLoading: false,
            ),
            20.verticalSpace,
          const   DashBoardContainer(
              title: 'Categories',
              number: '100',
              image: AppImages.categoriesDrawer,
              isLoading: false,
            ),
            20.verticalSpace,
           const DashBoardContainer(
              title: 'Users',
              number: '100',
              image:AppImages.usersDrawer ,
              isLoading: false,
            ),
          ],
        ),
      ),
      );
  }
}
