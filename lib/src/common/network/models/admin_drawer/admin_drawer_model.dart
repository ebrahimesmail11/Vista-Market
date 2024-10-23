import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/auth/presentation/view/login/login_screen.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/storage/local_storage_helper.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_dialogs.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/categories_screen.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/presentation/dash_board_screen.dart';
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
      page: const DashBoardScreen(),
    ),
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
      page: const CategoriesScreen(),
    ),
    AdminDrawerModel(
      icon: Icon(
        Icons.production_quantity_limits,
        color: context.colors.textColor,
      ),
      title: TextApp(
        text: 'Products',
        theme: context.displaySmall!.copyWith(
          fontSize: 17.h,
          fontFamily: TextStyles.poppinsEnglish,
          fontWeight: TextStyles.bold,
          color: context.colors.textColor,
        ),
      ),
      page: const ProductsScreen(),
    ),
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
      page: const UsersScreen(),
    ),
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
      page: const NotificatinsScreen(),
    ),
    AdminDrawerModel(
      icon: Icon(
        Icons.exit_to_app,
        color: context.colors.textColor,
      ),
      title: GestureDetector(
        onTap: () {
          CustomDialogs.twoButtonDialog(
            context: context,
            textBody: context.tr.log_out_from_app,
            textButton1: context.tr.yes,
            textButton2: context.tr.no,
            isLoading: false,
            onPressed: () async {
              final navigator = Navigator.of(context);
              await LocalStorageHelper.delete(PrefKeys.userRole);
              await LocalStorageHelper.delete(PrefKeys.userId);
              await LocalStorageHelper.delete(PrefKeys.tokenKey);
              await navigator.pushNamedAndRemoveUntil(
                  Routes.login, (route) => false,);
            },
          );
        },
        child: TextApp(
          text: 'Logout',
          theme: context.displaySmall!.copyWith(
            fontSize: 18.h,
            fontFamily: TextStyles.poppinsEnglish,
            fontWeight: TextStyles.bold,
            color: context.colors.textColor,
          ),
        ),
      ),
      page: const UsersScreen(),
    ),
  ];
}
