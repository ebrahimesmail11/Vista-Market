import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_liner_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: TextApp(
          text: context.tr.sign_up,
          theme: context.displaySmall!.copyWith(
            fontSize: 18.sp,
            fontWeight: TextStyles.bold,
          ),
        ),
      ),
    );
  }
}
