import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/customer/notifications/notifications_model.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';
import 'package:vista_market/src/resident/presentation/view/notification/controller/notification_controller.dart';
import 'package:vista_market/src/resident/presentation/view/notification/widgets/notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationsModel>>(
      stream: NotificationController().getNoyificationList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notification_add,
                  color: context.colors.textColor,
                  size: 150,
                ),
                TextApp(
                  text: 'You Not Has Notifications Now',
                  theme: context.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => NotificationItem(
            title: snapshot.data![index].title,
            body: snapshot.data![index].body,
            createdAt: snapshot.data![index].createdAt,
            isSeen: snapshot.data![index].isSeen,
            onTap: () {
              FirebaseFirestore.instance
                  .collection(AppConstants.userCollectionDataBase)
                  .doc(  SharedPref().getInt(PrefKeys.userId).toString())
                  .collection(AppConstants.notificationCollection)
                  .doc(snapshot.data![index].notificationId)
                  .update(
                {'isSeen': true},
              );
              if (snapshot.data![index].productId != -1) {
                context.pushNamed(
                  Routes.productDetails,
                  arguments: snapshot.data![index].productId,
                );
              }
            },
            onPressedRemoved: () async {
              await FirebaseFirestore.instance
                  .collection(AppConstants.userCollectionDataBase)
                  .doc(SharedPref().getInt(PrefKeys.userId).toString())
                  .collection(AppConstants.notificationCollection)
                  .doc(snapshot.data![index].notificationId)
                  .delete();
            },
          ),
          separatorBuilder: (context, index) => 10.verticalSpace,
        );
      },
    );
  }
}
