import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/push_notification/firebase_cloud_messaging.dart';
import 'package:vista_market/src/common/widgets/admin_widget/admin_app_bar_widget.dart';

class NotificatinsScreen extends StatelessWidget {
  const NotificatinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.mainColor,
      appBar: AdminAppBarWidget(
        isMain: true,
        backgroundColor: context.colors.mainColor!,
        title: 'Notifications',
      ),
      body: InkWell(
        onTap: () async {
             await FirebaseCloudMessaging().sendNotification(
               title: 'vista market title',
               body: 'vista market body',
               productId: -1,
             );
        },
        child: const Center(
          child: Text('Notifications'),
        ),
      ),
    );
  }
}
