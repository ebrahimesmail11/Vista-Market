import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/app_regex.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';

class LoginTextFromField extends StatefulWidget {
  const LoginTextFromField({super.key});

  @override
  State<LoginTextFromField> createState() => _LoginTextFromFieldState();
}
bool isShowPassword = true;
class _LoginTextFromFieldState extends State<LoginTextFromField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: context.tr.your_email,
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if(AppRegex.isEmailValid(p0!)){
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
              controller: TextEditingController(),
              hintText: context.tr.password,
              keyboardType: TextInputType.visiblePassword,
              validator: (p0) {
                if(AppRegex.isPasswordValid(p0!)){
                  return context.tr.valid_passwrod;
                }
                return null;
              },
              obscureText: isShowPassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    
                  });
                  isShowPassword = !isShowPassword;
                },
                icon: Icon(isShowPassword
                    ? Icons.visibility
                    : Icons.visibility_off,color: context.colors.textColor,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
