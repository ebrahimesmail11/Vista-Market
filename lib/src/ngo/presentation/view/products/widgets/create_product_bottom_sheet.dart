import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class CreateProductBottomSheet extends StatefulWidget {
  const CreateProductBottomSheet({super.key});

  @override
  State<CreateProductBottomSheet> createState() =>
      _CreateProductBottomSheetState();
}

class _CreateProductBottomSheetState extends State<CreateProductBottomSheet> {
  final fromKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: fromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextApp(
                text: 'Create Product',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 20.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Add a photo',
                  theme: context.displaySmall!.copyWith(
                    color: context.colors.textColor,
                    fontSize: 16.h,
                    fontWeight: TextStyles.medium,
                    fontFamily: TextStyles.poppinsEnglish,
                  ),
                ),
                CustomButton(
                  onPressed: () async {},
                  text: ' Remove',
                  width: 120.w,
                  height: 35.h,
                  lastRadius: 10,
                  threeRadius: 10,
                  textAlign: TextAlign.center,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            SizedBox(height: 10.h),
           // const CategoryUploadImage(),
            20.verticalSpace,
            TextApp(
              text: 'Enter the Product Name',
              theme: context.displaySmall!.copyWith(
                color: context.colors.textColor,
                fontSize: 16.h,
                fontWeight: TextStyles.medium,
                fontFamily: TextStyles.poppinsEnglish,
              ),
            ),
            10.verticalSpace,
            CustomTextField(
              controller: nameController,
              hintText: 'Enter the Category Name',
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (p0 == null || p0.isEmpty || p0.length < 2) {
                  return 'Please Selected Your Product Name';
                }
                return null;
              },
            ),
            20.verticalSpace,
            CustomButton(
              onPressed: () {},
              text: 'Create a new product',
              textColor: context.colors.bluePinkDark,
              backgroundColor: context.colors.textColor,
              width: MediaQuery.sizeOf(context).width,
              height: 50.h,
              lastRadius: 20,
              threeRadius: 20,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
    
  }
}
