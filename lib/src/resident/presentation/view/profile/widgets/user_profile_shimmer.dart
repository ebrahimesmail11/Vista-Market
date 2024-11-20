import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/loading_shimmer.dart';

class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LoadingShimmer(
            height: 80.h,
            width: 80.w,
            borderRadius: 45.r,
          ),
          7.verticalSpace,
          LoadingShimmer(
            height: 10.h,
            width: 100.w,
          ),
          7.verticalSpace,
          LoadingShimmer(
            height: 10.h,
            width: 150.w,
          ),
        ],
      ),
    );
  }
}
