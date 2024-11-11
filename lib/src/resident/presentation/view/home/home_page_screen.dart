import 'package:flutter/material.dart';
import 'package:vista_market/src/common/network/push_notification/firebase_cloud_messaging.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: FirebaseCloudMessaging().isNotificationScribed,
        builder: (_, value, __) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  value ? 'subScribed' : 'unSubscribed',
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  width: 20,
                ),
                Transform.scale(
                  scale: 1.4,
                  child: Switch.adaptive(
                    value: value,
                    inactiveTrackColor: Colors.red,
                    activeColor: Colors.green,
                    onChanged: (value) async {
                      await FirebaseCloudMessaging()
                          .controllerForUserSubscribeNotification();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
