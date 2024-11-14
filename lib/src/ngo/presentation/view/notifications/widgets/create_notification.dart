import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_bottom_sheet.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/cubit/add_notification/add_notification_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_notification/get_all_notification_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/create_notification_bottom_sheet.dart';

class CreateNotification extends StatelessWidget {
  const CreateNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Notifications',
          theme: context.displaySmall!.copyWith(
            color: context.colors.textColor,
            fontSize: 18.h,
            fontWeight: TextStyles.medium,
            fontFamily: TextStyles.poppinsEnglish,
          ),
        ),
        CustomButton(
          text: context.tr.add,
          backgroundColor: context.colors.bluePinkDark,
          onPressed: () {
            CustomBottomSheet.showModelBottomSheetContainer(
              context: context,
              widget: BlocProvider(
                create: (context) => getIt<AddNotificationCubit>(),
                child: const CreateNotificationBottomSheet(),
              ),
              whenComplete: () {
                context.read<GetAllNotificationCubit>().getAllNotification();
              },
            );
          },
          height: 35.h,
          width: 90.w,
          lastRadius: 10,
          threeRadius: 10,
        ),
      ],
    );
  }
}
