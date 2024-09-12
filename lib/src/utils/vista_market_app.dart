import 'package:flutter/material.dart';
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
            return MaterialApp(
              debugShowCheckedModeBanner: Env.instance.depugMode,
              title: 'Vista Market',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              builder: (context, child) {
                return Scaffold(
                  body: Builder(builder: (context) {
                    ConnectivityController.instance.init();
                    return child!;
                  },),
                );
              },
              home: const Scaffold(
                body: Center(
                  child: Text('Vista Market'),
                ),
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
        },);
  }
}
