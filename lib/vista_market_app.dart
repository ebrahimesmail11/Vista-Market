import 'package:flutter/material.dart';

class VistaMarketApp extends StatelessWidget {
  const VistaMarketApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
