import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class SearchNamePriceButton extends StatelessWidget {
  const SearchNamePriceButton({
    required this.onTap,
    required this.title,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onTap;
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.bluePinkDark
              : context.colors.navBarbg,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: TextApp(
            text: title,
            theme: context.displaySmall!.copyWith(
              fontSize: 15.sp,
              color: context.colors.textColor,
              fontWeight: TextStyles.bold,
            ),
          ),
        ),
      ),
    );
  }
}
