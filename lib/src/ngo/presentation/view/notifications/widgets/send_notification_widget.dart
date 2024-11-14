
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';
import 'package:vista_market/src/ngo/presentation/cubit/send_notification/send_notification_cubit.dart';

class SendNotificationWidget extends StatelessWidget {
  const SendNotificationWidget({
    required this.notificationModel,
    required this.indexId,
    super.key,
  });
  final AddNotificationModel notificationModel;
  final int indexId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendNotificationCubit, SendNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            MotionToast.success(description: const Text('Notification Sent'))
                .show(context);
           
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (index) {
            if (index == indexId) {
              return SizedBox(
                height: 25.h,
                width: 25.w,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: Colors.green,
                ),
              );
            }
          },
          orElse: () {
            return IconButton(
              onPressed: state is! Loading
                  ? () {
                      context.read<SendNotificationCubit>().sendNotification(
                            context,
                            title: notificationModel.title,
                            body: notificationModel.body,
                            productId: notificationModel.productId,
                            indexId: indexId,
                          );
                    
                    }
                  : null,
              icon: const Icon(
                Icons.send,
                color: Colors.green,
              ),
            );
          },
        );
      },
    );
  }
}
