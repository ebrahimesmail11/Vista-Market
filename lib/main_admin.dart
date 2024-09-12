import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vista_market/firebase_options.dart';
import 'package:vista_market/src/utils/env.dart';
import 'package:vista_market/src/utils/vista_market_app.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Env.instance.init(envTypeEnum: EnvTypeEnum.admin);  
  await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
  runApp(const VistaMarketApp());
}