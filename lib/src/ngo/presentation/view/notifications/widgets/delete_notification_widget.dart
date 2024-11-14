import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';
import 'package:vista_market/src/ngo/presentation/cubit/add_notification/add_notification_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_notification/get_all_notification_cubit.dart';

class DeleteNotificationWidget extends StatelessWidget {
  const DeleteNotificationWidget({
    required this.notificationModel,
    super.key,
  });
  final AddNotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotificationCubit, AddNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () async {
            await context.read<GetAllNotificationCubit>().getAllNotification();
            MotionToast.success(description: const Text('Notification Deleted'))
                .show(context);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return SizedBox(
              height: 15.h,
              width: 15.w,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<AddNotificationCubit>().deleteNotification(
                      notificationModel: notificationModel,
                    );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            );
          },
        );
      },
    );
  }
}
