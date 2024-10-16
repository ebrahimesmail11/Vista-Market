import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/auth/presentation/cubit/login/auth_cubit.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/app_regex.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';

class TextFormFieldRegistration extends StatefulWidget {
  const TextFormFieldRegistration({super.key});

  @override
  State<TextFormFieldRegistration> createState() =>
      _TextFormFieldRegistrationState();
}



class _TextFormFieldRegistrationState extends State<TextFormFieldRegistration> {
  bool isShowPassword = true;
  late AuthCubit _authCubit;
  @override
  void initState() {
    super.initState();
     _authCubit=context.read<AuthCubit>();
  }

  @override
  void dispose() {
    _authCubit.nameController.dispose();
    _authCubit.emailController.dispose();
    _authCubit.passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authCubit.formKey,
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              controller: _authCubit.nameController,
              hintText: context.tr.full_name,
              keyboardType: TextInputType.name,
              validator: (p0) {
                if (p0 == null || p0.isEmpty|| p0.length< 4 || p0.length> 20) {
                  return context.tr.valid_name;
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25.h),
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              controller: _authCubit.emailController,
              hintText: context.tr.your_email,
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (!AppRegex.isEmailValid(p0!)) {
                  return context.tr.valid_email;
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25.h),
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              controller:_authCubit.passwordController,
              hintText: context.tr.password,
              keyboardType: TextInputType.visiblePassword,
              validator: (p0) {
                if (!AppRegex.isPasswordValid(p0!)) {
                  return context.tr.valid_passwrod;
                }
                return null;
              },
              obscureText: isShowPassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {});
                  isShowPassword = !isShowPassword;
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility : Icons.visibility_off,
                  color: context.colors.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
