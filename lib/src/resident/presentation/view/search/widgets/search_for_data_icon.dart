import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';

class SearchForDataIcon extends StatelessWidget {
  const SearchForDataIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.search_sharp,
          color: context.colors.textColor,
          size: 150.r,
        ),
        10.verticalSpace,
        Text(
          context.tr.search_data,
          style: context.displaySmall!.copyWith(
            fontSize: 18.sp,
            color: context.colors.textColor,
            fontWeight: TextStyles.bold,
          ),
        ),
      ],
    );
  }
}
