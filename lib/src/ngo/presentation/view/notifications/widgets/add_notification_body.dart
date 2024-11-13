import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/admin_widget/empty_screen.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_notification/get_all_notification_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/add_notification_item.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/create_notification.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          const CreateNotification(),
          20.verticalSpace,
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: BlocBuilder<GetAllNotificationCubit,
                      GetAllNotificationState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                        success: (notifications) {
                             return ListView.separated(
                        itemBuilder: (context, index) {
                          return  AddNotificationItem(
                            notificationModel: notifications[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 15.h,
                          );
                        },
                        itemCount: notifications.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
                        },
                        empty: EmptyScreen.new,
                        failure: Text.new,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: 20.verticalSpace,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
