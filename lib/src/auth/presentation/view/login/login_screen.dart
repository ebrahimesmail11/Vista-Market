import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/auth/presentation/cubit/login/auth_cubit.dart';
import 'package:vista_market/src/auth/presentation/view/login/widgets/login_button.dart';
import 'package:vista_market/src/auth/presentation/view/login/widgets/login_cutom_pointer.dart';
import 'package:vista_market/src/auth/presentation/view/login/widgets/login_header.dart';
import 'package:vista_market/src/auth/presentation/view/login/widgets/login_text_from_field.dart';
import 'package:vista_market/src/auth/presentation/view/login/widgets/login_titles_section.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<AuthCubit>(),
      child: Scaffold(
        bottomNavigationBar: CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            150.h,
          ),
          painter: AuthCustomPainter(
            gradient: LinearGradient(
              colors: [
                context.colors.bluePinkLight!,
                context.colors.bluePinkLight!,
                context.colors.bluePinkLight!,
                context.colors.bluePinkDark!,
              ],
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsetsDirectional.only(
            start: 20.w,
            end: 20.w,
            top: 40.h,
            bottom: 20.h,
          ),
          children: <Widget>[
            const LoginHeader(),
            SizedBox(
              height: 50.h,
            ),
            LoginTitlesSection(
              title: context.tr.login,
              description: context.tr.welcome,
            ),
            SizedBox(
              height: 30.h,
            ),
            const LoginTextFromField(),
            SizedBox(
              height: 30.h,
            ),
            const LoginButton(),
            SizedBox(
              height: 30.h,
            ),
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.registration);
                },
                // onPressed: () => context.pushReplacementNamed(
                //   Routes.registration,
                // ),
                child: TextApp(
                  text: context.tr.create_account,
                  theme: context.displaySmall!.copyWith(
                    color: context.colors.bluePinkLight,
                    fontSize: 16.h,
                    fontWeight: TextStyles.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
