import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text(
            'Get Token',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async{
         
           final token = await FirebaseMessaging.instance.getToken();
           
            log( token.toString() ,);
          },
        ),
      ),
    );
  }
}
