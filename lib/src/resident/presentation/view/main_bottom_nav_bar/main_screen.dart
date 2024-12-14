import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/base/nav_bar_enum.dart';
import 'package:vista_market/src/common/widgets/customer_widget/main_customer_app_bar.dart';
import 'package:vista_market/src/resident/presentation/cubit/main_nav_bar/main_cubit_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/favorites/favorites_screen.dart';
import 'package:vista_market/src/resident/presentation/view/home/home_page_screen.dart';
import 'package:vista_market/src/resident/presentation/view/main_bottom_nav_bar/widgets/main_bottom_nav_bar.dart';
import 'package:vista_market/src/resident/presentation/view/notification/notification_page_screen.dart';

import 'package:vista_market/src/resident/presentation/view/profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainCubitCubit>()..navBarEnum,
      child: Scaffold(
        appBar: const MainCustomerAppBar(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(context.images.homeBg!),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: BlocBuilder<MainCubitCubit, MainCubitState>(
                  builder: (context, state) {
                    final navBarEnum =
                        context.watch<MainCubitCubit>().navBarEnum;
                    switch (navBarEnum) {
                      case NavBarEnum.home:
                        return const HomePageScreen();
                      case NavBarEnum.favorites:
                        return const FavoritesScreen();
                      case NavBarEnum.notification:
                        return const NotificationPageScreen();
                      case NavBarEnum.profile:
                        return const ProfileScreen();
                      // ignore: no_default_cases
                      default:
                        return const Center(child: Text('invalid state'));
                    }
                  },
                ),
              ),
              const MainBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
