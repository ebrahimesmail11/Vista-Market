import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

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
                return null;
              },
            ),
            20.verticalSpace,
            CustomButton(
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
            ),
          ],
        ),
      ),
    );
  }

  void _validateAddNotification(BuildContext context) {}
}
