import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/flavor.dart';
import 'package:vista_market/src/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:vista_market/src/auth/presentation/cubit/cubit/auth_state.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/custom_liner_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/vista_market_app.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          final flavor =
              (context.findAncestorWidgetOfExactType<VistaMarketApp>()
                      as VistaMarketApp)
                  .flavor;
          state.whenOrNull(
            success: () {
              if (flavor == Flavor.admin) {
                context.pushReplacementNamed(Routes.homePageScreenAdmin);
              } else {
                context.pushReplacementNamed(Routes.homePageScreen);
              }
              return MotionToast.success(
                description: Text(
                  context.tr.logged_successfully,
                  style: context.displayMedium!.copyWith(
                    fontSize: 14.sp,
                    color: context.colors.mainColor,
                  ),
                ),
              );
            },
            failure: (message) {
              return MotionToast.success(
                description: Text(
                  context.tr.logged_error,
                  style: context.displayMedium!.copyWith(
                    fontSize: 14.sp,
                    color: context.colors.mainColor,
                  ),
                ),
              ).show(context);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                onPressed: () {},
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
            orElse: () {
              return CustomLinearButton(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                onPressed: () async {
                  await _validateThenDoLogin(context);
                },
                child: TextApp(
                  text: context.tr.login,
                  theme: context.displaySmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: TextStyles.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _validateThenDoLogin(BuildContext context) async {
    if (context.read<AuthCubit>().formKey.currentState!.validate()) {
      await context.read<AuthCubit>().login();
    }
  }
}
