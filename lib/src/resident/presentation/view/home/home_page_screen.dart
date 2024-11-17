import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/customer_widget/main_customer_app_bar.dart';
import 'package:vista_market/src/resident/presentation/view/main_bottom_nav_bar/main_bottom_nav_bar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainCustomerAppBar(),
      body:Container(
        constraints: const BoxConstraints.expand(),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(context.images.homeBg!),
            fit: BoxFit.fill,
          ),
        ),
        child: const Column(
          children: [
            Expanded(child: Text('Main Screen'),),
            MainBottomNavBar(),
          ],
        ),
      ),
    );
  }
}
