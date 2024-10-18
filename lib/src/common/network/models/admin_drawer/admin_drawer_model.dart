import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/categories_screen.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/dash_board_screen.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/notificatins_screen.dart';
import 'package:vista_market/src/ngo/presentation/view/products/products_screen.dart';
import 'package:vista_market/src/ngo/presentation/view/users/users_screen.dart';

class AdminDrawerModel {
  AdminDrawerModel({
    required this.icon,
    required this.title,
    required this.page,
  });
  final Icon icon;
  final Widget title;
  final Widget page;
}

List<AdminDrawerModel> adminDrawerList(BuildContext context) {
  return <AdminDrawerModel>[
    AdminDrawerModel(
        icon: Icon(
          Icons.dashboard,
          color: context.colors.textColor,
        ),
        title: TextApp(
          text: context.tr.dashboard,
          theme: context.displaySmall!.copyWith(
            fontSize: 17.h,
            fontFamily: TextStyles.poppinsEnglish,
            fontWeight: TextStyles.bold,
            color: context.colors.textColor,
          ),
        ),
        page: const  DashBoardScreen(),),
         AdminDrawerModel(
        icon: Icon(
          Icons.category_outlined,
          color: context.colors.textColor,
        ),
        title: TextApp(
          text: 'Categories',
          theme: context.displaySmall!.copyWith(
            fontSize: 17.h,
            fontFamily: TextStyles.poppinsEnglish,
            fontWeight: TextStyles.bold,
            color: context.colors.textColor,
          ),
        ),
        page: const  CategoriesScreen(),),
         AdminDrawerModel(
        icon: Icon(
          Icons.production_quantity_limits,
          color: context.colors.textColor,
        ),
        title: TextApp(
          text:'Products',
          theme: context.displaySmall!.copyWith(
            fontSize: 17.h,
            fontFamily: TextStyles.poppinsEnglish,
            fontWeight: TextStyles.bold,
            color: context.colors.textColor,
          ),
        ),
        page: const  ProductsScreen(),),
         AdminDrawerModel(
        icon: Icon(
          Icons.people_alt_rounded,
          color: context.colors.textColor,
        ),
        title: TextApp(
          text: 'Users',
          theme: context.displaySmall!.copyWith(
            fontSize: 18.h,
            fontFamily: TextStyles.poppinsEnglish,
            fontWeight: TextStyles.bold,
            color: context.colors.textColor,
          ),
        ),
        page: const  UsersScreen(),),
         AdminDrawerModel(
        icon: Icon(
          Icons.notifications_active,
          color: context.colors.textColor,
        ),
        title: TextApp(
          text: 'Notifications',
          theme: context.displaySmall!.copyWith(
            fontSize: 18.h,
            fontFamily: TextStyles.poppinsEnglish,
            fontWeight: TextStyles.bold,
            color: context.colors.textColor,
          ),
        ),
        page: const  NotificatinsScreen(),),
  ];
}
