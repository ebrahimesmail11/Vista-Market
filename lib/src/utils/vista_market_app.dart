import 'package:flutter/material.dart';
import 'package:vista_market/src/utils/env.dart';

class VistaMarketApp extends StatelessWidget {
  const VistaMarketApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: Env.instance.depugMode,
      title: 'Vista Market',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const  Scaffold(
        body: Center(
          child: Text('Vista Market'),
        ),
      ),
    );
  }
}
