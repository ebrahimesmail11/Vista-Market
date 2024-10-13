import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class LoginTitlesSection extends StatelessWidget {
  const LoginTitlesSection({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          TextApp(
            text: title,
            theme: context.displaySmall!.copyWith(
              fontSize: 24.h,
              color: context.colors.textColor,
              fontWeight: TextStyles.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextApp(
            text: description,
            theme: context.displaySmall!.copyWith(
              fontSize: 17.h,
              color: context.colors.textColor,
              fontWeight: TextStyles.medium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
