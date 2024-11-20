import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_dialogs.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = context.read<AppCubit>();
        return Row(
          children: [
            SvgPicture.asset(
              AppImages.language,
              color: context.colors.textColor,
            ),
            10.horizontalSpace,
            TextApp(
              text: context.tr.language_tilte,
              theme: context.displaySmall!.copyWith(
                fontSize: 18.sp,
                color: context.colors.textColor,
                fontWeight: TextStyles.regular,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                CustomDialogs.twoButtonDialog(
                  context: context,
                  textBody: context.tr.change_to_the_language,
                  textButton1: context.tr.sure,
                  textButton2: context.tr.cancel,
                  onPressed: () {
                    selectedLanguage(
                      context: context,
                      cubit: cubit,
                    );
                  },
                  isLoading: false,
                );
              },
              child: Row(
                children: [
                  TextApp(
                    text: context.tr.language,
                    theme: context.displaySmall!.copyWith(
                      fontSize: 14.sp,
                      color: context.colors.textColor,
                      fontWeight: TextStyles.regular,
                    ),
                  ),
                  5.horizontalSpace,
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.colors.textColor,
                    size: 15.sp,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void selectedLanguage({
    required BuildContext context,
    required AppCubit cubit,
  }) {
    if (context.isEnlocale) {
      cubit.langAraibc();
    } else {
      cubit.langEnglish();
    }
    context.pop();
  }
}
