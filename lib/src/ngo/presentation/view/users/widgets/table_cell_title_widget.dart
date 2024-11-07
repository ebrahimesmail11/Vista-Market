

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class TableCellTitleWidget extends StatelessWidget {
  const TableCellTitleWidget({
    required this.icon, required this.title, super.key,});
final IconData icon;
final String title;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
      child: Row(
        children: [
          Icon(
            icon,
            color: context.colors.textColor,
            size: 20.h,),
            SizedBox(width: 5.w,),
            TextApp(
              text: title,
              theme: context.displaySmall!.copyWith(
                fontSize: 15.h,
                fontFamily: TextStyles.poppinsEnglish,
                fontWeight: TextStyles.medium,
                color: context.colors.textColor,
              ),
            ),
        ],
      ),
    );
  }
}