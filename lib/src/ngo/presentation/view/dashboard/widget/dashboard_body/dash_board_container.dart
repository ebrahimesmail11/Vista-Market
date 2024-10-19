import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_container_linear_admin.dart';
import 'package:vista_market/src/common/widgets/loading_shimmer.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class DashBoardContainer extends StatelessWidget {
  const DashBoardContainer({
    required this.title,
    required this.number,
    required this.image,
    required this.isLoading,
    super.key,
  });
  final String title;
  final String number;
  final String image;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextApp(
                  text: title,
                  theme: context.displaySmall!.copyWith(
                    fontSize: 24.sp,
                    fontWeight: TextStyles.bold,
                    color: context.colors.textColor,
                  ),
                ),
                const Spacer(),
                if (isLoading)
                  LoadingShimmer(
                    height: 30.h,
                    width: 100.w,
                  )
                else
                  TextApp(
                    text: number,
                    theme: context.displaySmall!.copyWith(
                      fontSize: 24.sp,
                      fontWeight: TextStyles.bold,
                      color: context.colors.textColor,
                    ),
                  ),
                  const Spacer(),
              
              ],
            ),
              
                SizedBox(
                  height: 90.h,
                  child: Image.asset(image),
                ),
          ],
        ),
      ),
    );
  }
}
