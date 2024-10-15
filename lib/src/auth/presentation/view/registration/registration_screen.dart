import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/auth/presentation/view/login/widgets/login_cutom_pointer.dart';
import 'package:vista_market/src/auth/presentation/view/login/widgets/login_header.dart';
import 'package:vista_market/src/auth/presentation/view/login/widgets/login_titles_section.dart';
import 'package:vista_market/src/auth/presentation/view/registration/widgets/registration_button.dart';
import 'package:vista_market/src/auth/presentation/view/registration/widgets/text_form_field_registration.dart';
import 'package:vista_market/src/auth/presentation/view/registration/widgets/user_avtar.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';




class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          40.h,
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
            title: context.tr.sign_up,
            description: context.tr.sign_up_welcome,
          ),
          SizedBox(
            height: 10.h,
          ),
          const UserAvtar(),
          SizedBox(
            height: 30.h,
          ),
          const TextFormFieldRegistration(),
          SizedBox(
            height: 30.h,
          ),
          const RegistrationButton(),
          SizedBox(
            height: 30.h,
          ),
          CustomFadeInDown(
            duration: 400,
            child: TextButton(
              onPressed: () => context.pushReplacementNamed(Routes.login),
              child: TextApp(
                text: context.tr.you_have_account,
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
    );
  }
}
