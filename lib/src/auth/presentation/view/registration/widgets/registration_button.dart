import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/flavor.dart';
import 'package:vista_market/src/auth/presentation/cubit/login/auth_cubit.dart';
import 'package:vista_market/src/auth/presentation/cubit/login/auth_state.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/base/user_type.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/custom_linear_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            final flavor = FlavorConfig.instance.flavor;

            if (!_isRoleAllowedForFlavor(flavor, userRole)) {
              _showErrorToast(context, _getErrorMessage(flavor, userRole));
              return;
            }
            log('userRole: $userRole, flavor: $flavor');
            Future.delayed(const Duration(milliseconds: 500), () {
              if (context.mounted) {
                _navigateUser(context, userRole);
              }
            });
            MotionToast.success(
              description: Text(
                context.tr.logged_successfully,
                style: context.displayMedium!.copyWith(
                  fontSize: 14.sp,
                  color: context.colors.mainColor,
                ),
              ),
            ).show(context);
          },
          failure: (message) {
            _showErrorToast(context, message);
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
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                onPressed: () async {
                  await _validateThenDoRegister(context);
                },
                child: TextApp(
                  text: context.tr.sign_up,
                  theme: context.displaySmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: TextStyles.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  bool _isRoleAllowedForFlavor(Flavor flavor, String userRole) {
    switch (flavor) {
      case Flavor.admin:
        return userRole == UserTypes.admin.name;
      case Flavor.customer:
        return userRole == UserTypes.customer.name;
      // ignore: no_default_cases
      default:
        return false;
    }
  }

  String _getErrorMessage(Flavor flavor, String userRole) {
    if (flavor == Flavor.admin && userRole != UserTypes.admin.name) {
      return 'غير مسموح لك بتسجيل الدخول كـ Customer.';
    } else if (flavor == Flavor.customer &&
        userRole != UserTypes.customer.name) {
      return 'غير مسموح لك بتسجيل الدخول كـ admin.';
    } else {
      return 'نكهة التطبيق غير معروفة.';
    }
  }

  void _showErrorToast(BuildContext context, String message) {
    MotionToast.error(
      description: Text(
        message,
        style: context.displayMedium!.copyWith(
          fontSize: 14.sp,
          color: context.colors.mainColor,
        ),
      ),
    ).show(context);
  }

  void _navigateUser(BuildContext context, String userRole) {
    if (userRole == UserTypes.admin.name &&
        FlavorConfig.instance.flavor == Flavor.admin) {
      Navigator.of(context).pushReplacementNamed(Routes.homePageScreenAdmin);
    } else if (userRole == UserTypes.customer.name &&
        FlavorConfig.instance.flavor == Flavor.customer) {
      Navigator.of(context).pushReplacementNamed(Routes.homePageScreen);
    }
  }

  Future<void> _validateThenDoRegister(BuildContext context) async {
    final authCubit = context.read<AuthCubit>();
    final uploadCubit = context.read<UploadImageCubit>();
    if ((authCubit.formKey.currentState?.validate() ?? false) &&
        uploadCubit.getimageUrl.isNotEmpty) {
      log('Attempting registration with imageUrl: ${uploadCubit.getimageUrl}');
      await authCubit.register(
        context,
        imageUrl: uploadCubit.getimageUrl,
      );
      log('imageUrl: ${uploadCubit.getimageUrl}');
    } else {
      if (uploadCubit.getimageUrl.isEmpty) {
        MotionToast.error(
          description: Text(
            context.tr.valid_pick_image,
            style: context.displayMedium!.copyWith(
              fontSize: 14.sp,
              color: context.colors.mainColor,
            ),
          ),
        ).show(context);
      }
    }
  }
}
