import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_liner_button.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';



class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ctx= context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder(
          bloc: ctx,
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 300,
              child: CustomLinearButton(
                onPressed:ctx.changeTheme,
                child:  Icon(
                ctx.isDark ? Icons.light_mode_rounded:Icons.dark_mode_rounded ,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            height: 44.h,
            width: 100.w,
            onPressed: () {},
            child: Text(
              context.tr.language,
              style: context.displaySmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: TextStyles.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
