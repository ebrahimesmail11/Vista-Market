import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/loading_shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15.w,),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              LoadingShimmer(
                height: 71.h,
                width: 71.w,
                borderRadius: 15.r,
              ),
              10.verticalSpace,
              LoadingShimmer(
                height: 31.h,
                width: 75.w,
                borderRadius: 10.r,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => 10.horizontalSpace,
        itemCount: 7,
      ),
    );
  }
}
