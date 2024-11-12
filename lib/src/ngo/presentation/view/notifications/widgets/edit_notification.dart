import 'package:flutter/material.dart';
import 'package:vista_market/src/common/widgets/custom_bottom_sheet.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/edit_notification_bottom_sheet.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CustomBottomSheet.showModelBottomSheetContainer(
          context: context, 
          widget:const EditNotificationBottomSheet() ,
          );
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.yellow,
      ),
    );
  }
}
