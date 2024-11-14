import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_container_linear_admin.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/delete_notification_widget.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/edit_notification.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/notification_info.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/send_notification_widget.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem(
      {required this.index, required this.notificationModel, super.key,});
  final AddNotificationModel notificationModel;
  final int index;
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
                DeleteNotificationWidget(
                  notificationModel: notificationModel,
                ),
                40.verticalSpace,
                EditNotification(
                  notificationModel: notificationModel,
                ),
                40.verticalSpace,
                SendNotificationWidget(
                  notificationModel: notificationModel,
                  indexId: index,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
