import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/routing/route_manger.dart';

import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/utils/connectivity_controller.dart';
import 'package:vista_market/src/utils/env.dart';
import 'package:vista_market/src/utils/no_network_screen.dart';


class VistaMarketApp extends StatelessWidget {
  const VistaMarketApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: Env.instance.depugMode,
              title: 'Vista Market',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              builder: (context, child) {
                return Scaffold(
                  body: Builder(
                    builder: (context) {
                      ConnectivityController.instance.init();
                      return child!;
                    },
                  ),
                );
              },
              onGenerateRoute: RouteManger.generateRoute,
              initialRoute: Routes.initialRoute,
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: Env.instance.depugMode,
            title: 'Vista Market',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
