import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/firebase_options.dart';
import 'package:vista_market/flavor.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';
import 'package:vista_market/src/utils/bloc_observer.dart';
import 'package:vista_market/src/utils/env.dart';
import 'package:vista_market/src/vista_market_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.instance.init(envTypeEnum: EnvTypeEnum.resident);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPref().instantiatePreferences();
 await initGetIt();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const VistaMarketApp(flavor: Flavor.resident,));
  });
}
