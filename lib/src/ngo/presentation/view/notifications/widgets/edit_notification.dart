import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';
import 'package:vista_market/src/common/widgets/custom_bottom_sheet.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_notification/get_all_notification_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/edit_notification_bottom_sheet.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({required this.notificationModel, super.key,});
final AddNotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CustomBottomSheet.showModelBottomSheetContainer(
          context: context, 
          widget: EditNotificationBottomSheet(
            notificationModel: notificationModel,
          ),
          whenComplete: () {
            context.read<GetAllNotificationCubit>().getAllNotification();
          },
          );
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.yellow,
      ),
    );
  }
}
