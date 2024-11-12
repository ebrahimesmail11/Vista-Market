import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/add_notification_item.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/create_notification.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          const CreateNotification(),
          20.verticalSpace,
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const AddNotificationItem();
                    },
                    separatorBuilder: (context, index) {
                      return  SizedBox(
                        height: 15.h,
                      );
                    },
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
