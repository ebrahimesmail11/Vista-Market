import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vista_market/flavor.dart';
import 'package:vista_market/src/auth/presentation/view/login/login_screen.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/generated/app_localizations.dart';
import 'package:vista_market/src/common/routing/route_manger.dart';
import 'package:vista_market/src/common/storage/local_storage_helper.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';
import 'package:vista_market/src/ngo/presentation/view/home_page/home_page_screen_admin.dart';

import 'package:vista_market/src/resident/presentation/view/home/home_page_screen.dart';
import 'package:vista_market/src/utils/connectivity_controller.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';
import 'package:vista_market/src/utils/env.dart';
import 'package:vista_market/src/utils/no_network_screen.dart';
import 'package:vista_market/src/utils/theme/app_theme.dart';

class VistaMarketApp extends StatelessWidget {
  const VistaMarketApp({
    required this.flavor,
    super.key,
  });

  final Flavor flavor;
  Future<String?> getUserRole() async {
    final role = await LocalStorageHelper.read(PrefKeys.userRole);
    if (role != null && role.isNotEmpty) {
      return role;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final appTitle =
        flavor == Flavor.admin ? 'Vista Market Admin' : 'Vista Market';
    return BlocProvider(
      create: (context) => getIt<AppCubit>()
        ..changeTheme(
          sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
        )
        ..savedlanguage(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              final appCubit = context.read<AppCubit>();
              return MaterialApp(
                debugShowCheckedModeBanner: Env.instance.depugMode,
                title: appTitle,
                theme: appCubit.isDark ? themeLight() : themeDark(),
                locale: Locale(appCubit.currentLanguage),
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (final locale in supportedLocales) {
                    if (locale.languageCode == deviceLocale!.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                home: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: ValueListenableBuilder<bool>(
                        valueListenable:
                            ConnectivityController.instance.isConnected,
                        builder: (context, isConnected, child) {
                          if (!isConnected) {
                            return const NoNetworkScreen();
                          } else {
                            return FutureBuilder<String?>(
                              future: getUserRole(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Scaffold(
                                    body: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return const Scaffold(
                                    body: Center(
                                      child: Text(
                                        'خطأ في تحميل البيانات.',
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasData &&
                                    snapshot.data != null) {
                                  final role = snapshot.data!;
                                  if (flavor == Flavor.admin &&
                                      role == 'admin') {
                                    return const HomePageScreenAdmin();
                                  } else if (flavor == Flavor.customer &&
                                      role == 'customer') {
                                    return const HomePageScreen();
                                  } else {
                                    return const LoginScreen();
                                  }
                                } else {
                                  return const LoginScreen();
                                }
                              },
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
                navigatorKey: getIt<GlobalKey<NavigatorState>>(),
                onGenerateRoute: RouteManger.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
