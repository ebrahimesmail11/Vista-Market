import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/cubit/add_notification/add_notification_cubit.dart';

class CreateNotificationBottomSheet extends StatefulWidget {
  const CreateNotificationBottomSheet({super.key});

  @override
  State<CreateNotificationBottomSheet> createState() =>
      _CreateNotificationBottomSheetState();
}

class _CreateNotificationBottomSheetState
    extends State<CreateNotificationBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    productIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextApp(
                text: 'Add Notification',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 20.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
            ),
            20.verticalSpace,
            TextApp(
              text: 'Enter the Notification title ',
              theme: context.displaySmall!.copyWith(
                color: context.colors.textColor,
                fontSize: 16.h,
                fontWeight: TextStyles.medium,
                fontFamily: TextStyles.poppinsEnglish,
              ),
            ),
            20.verticalSpace,
            CustomTextField(
              controller: titleController,
              hintText: 'Title',
              validator: (p0) {
                if (p0 == null || p0.isEmpty || p0.length < 2) {
                  return 'Please Selected Your title Name';
                }
                return null;
              },
            ),
            20.verticalSpace,
            TextApp(
              text: 'Enter the Notification body ',
              theme: context.displaySmall!.copyWith(
                color: context.colors.textColor,
                fontSize: 16.h,
                fontWeight: TextStyles.medium,
                fontFamily: TextStyles.poppinsEnglish,
              ),
            ),
            20.verticalSpace,
            CustomTextField(
              controller: bodyController,
              hintText: 'Body',
              validator: (p0) {
                if (p0 == null || p0.isEmpty || p0.length < 2) {
                  return 'Please Selected Your Body Name';
                }
                return null;
              },
            ),
            20.verticalSpace,
            TextApp(
              text: 'Enter the Notification Prodict Id ',
              theme: context.displaySmall!.copyWith(
                color: context.colors.textColor,
                fontSize: 16.h,
                fontWeight: TextStyles.medium,
                fontFamily: TextStyles.poppinsEnglish,
              ),
            ),
            20.verticalSpace,
            CustomTextField(
              controller: productIdController,
              hintText: 'Product Id',
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Please Selected Your Product Id ';
                }
                return null;
              },
            ),
            20.verticalSpace,
            BlocConsumer<AddNotificationCubit, AddNotificationState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    MotionToast.success(
                      description: const Text(
                        ' Notification Created Successfully.',
                      ),
                      animationDuration: const Duration(
                        seconds: 2,
                      ),
                    ).show(context);
                  },
                  failure: (message) {
                    MotionToast.error(
                      description: Text(
                        message,
                        style: context.displayMedium!.copyWith(
                          fontSize: 14.sp,
                          color: context.colors.mainColor,
                        ),
                      ),
                    ).show(context);
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return Container(
                      height: 50.h,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: context.colors.textColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: context.colors.bluePinkDark,
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        _validateAddNotification(context);
                      },
                      text: 'Create a new Notification',
                      textColor: context.colors.bluePinkDark,
                      backgroundColor: context.colors.textColor,
                      width: MediaQuery.sizeOf(context).width,
                      height: 50.h,
                      lastRadius: 20,
                      threeRadius: 20,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _validateAddNotification(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await context.read<AddNotificationCubit>().addNotification(
            notificationModel: AddNotificationModel(
              title: titleController.text.trim(),
              body: bodyController.text.trim(),
              productId: int.parse(productIdController.text.trim()),
              createdAt: DateTime.now(),
            ),
          );
    }
  }
}
