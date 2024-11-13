import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_container_linear_admin.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/edit_notification.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/notification_info.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({required this.notificationModel, super.key});
  final AddNotificationModel notificationModel;
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
            NotificationInfo(
              title: 'Title: ',
              body: notificationModel.title,
            ),
            const Spacer(),
            NotificationInfo(
              title: 'Body:  ',
              body: notificationModel.body,
            ),
            const Spacer(),
            NotificationInfo(
              title: 'Create At: ',
              body: notificationModel.createdAt.getFormatDayMonth(),
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
                EditNotification(
                  notificationModel: notificationModel,
                ),
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
