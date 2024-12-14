import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/resident/presentation/view/notification/widgets/notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => const NotificationItem(),
      separatorBuilder: (context, index) => 10.verticalSpace,
    );
  }
}
