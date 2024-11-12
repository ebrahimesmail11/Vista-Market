import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_container_linear_admin.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/edit_notification.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/notification_info.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            const Spacer(),
            const NotificationInfo(
              title: 'Title: ',
              body: 'title lasgcesese',
            ),
            const Spacer(),
            const NotificationInfo(
              title: 'Body:  ',
              body: 'body lasgcesese',
            ),
            const Spacer(),
            const NotificationInfo(
              title: 'Create At: ',
              body: '17-11-2022',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                40.verticalSpace,
                const EditNotification(),
                40.verticalSpace,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
