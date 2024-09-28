import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vista_market/flavor.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/generated/app_localizations.dart';

import 'package:vista_market/src/common/routing/route_manger.dart';

import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/storage/local_storage_helper.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';
import 'package:vista_market/src/utils/connectivity_controller.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';
import 'package:vista_market/src/utils/env.dart';
import 'package:vista_market/src/utils/no_network_screen.dart';
import 'package:vista_market/src/utils/theme/app_theme.dart';

class VistaMarketApp extends StatelessWidget {
  const VistaMarketApp({
    super.key,
    required this.flavor,
  });
  final Flavor flavor;

  Future<List<String>> get userInfo async {
   await checkUserLoggiedIn();
     var jwt = await LocalStorageHelper.read(PrefKeys.tokenKey);
    var userId = await LocalStorageHelper.read(PrefKeys.userId);
    var userType = await LocalStorageHelper.read(AppConstants.user);

    jwt ??= '';
    userId ??= '';
    userType ??= '';

    if (jwt == '' && userId == '' && userType == '') return [];

    return [jwt, userId, userType];
  }

  Future<void> checkUserLoggiedIn()async {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey(PrefKeys.tokenKey)) {
      await LocalStorageHelper.deleteAll();
      isLoggedInUser = false;
    }
    await LocalStorageHelper.read(PrefKeys.tokenKey);
      isLoggedInUser =true;
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return BlocProvider(
            create: (context) => getIt<AppCubit>()
              ..changeTheme(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              )
              ..savedlanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  final ctx = context.read<AppCubit>();
                  return MaterialApp(
                    debugShowCheckedModeBanner: Env.instance.depugMode,
                    title: 'Vista Market',
                    theme: ctx.isDark ? themeLight() : themeDark(),
                    locale: Locale(ctx.currentLanguage),
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (locale.languageCode == deviceLocale!.languageCode) {
                          return deviceLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    builder: (context, child) {
                      return GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Scaffold(
                          body: Builder(
                            builder: (context) {
                              ConnectivityController.instance.init();
                              return child!;
                            },
                          ),
                        ),
                      );
                    },
                    onGenerateRoute: RouteManger.generateRoute,
                     initialRoute: Routes.login,
                  );
                },
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
      },
    );
  }
}
