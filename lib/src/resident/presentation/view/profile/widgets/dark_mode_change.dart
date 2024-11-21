import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';

class DarkModeChange extends StatelessWidget {
  const DarkModeChange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.darkMode,
          color: context.colors.textColor,
        ),
        10.horizontalSpace,
        TextApp(
          text: context.tr.dark_mode,
          theme: context.displaySmall!.copyWith(
            fontSize: 18.sp,
            color: context.colors.textColor,
            fontWeight: TextStyles.regular,
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.75,
          child: Switch.adaptive(
            inactiveTrackColor: const Color(0xff262626),
            activeColor: Colors.green,
            value: cubit.isDark,
            onChanged: (p0) {
              cubit.changeTheme();
            },
          ),
        ),
      ],
    );
  }
}
