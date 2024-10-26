import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/widget/update_upload_image.dart';

class UpdateCategoryBottomWidget extends StatefulWidget {
  const UpdateCategoryBottomWidget({super.key});
  


  @override
  State<UpdateCategoryBottomWidget> createState() =>
      _UpdateCategoryBottomWidgetState();
}

class _UpdateCategoryBottomWidgetState
    extends State<UpdateCategoryBottomWidget> {
  final fromKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: fromKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextApp(
                text: 'Update Category',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 20.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
            ),
            SizedBox(height: 20.h),
           TextApp(
                  text: 'Update a photo',
                  theme: context.displaySmall!.copyWith(
                    color: context.colors.textColor,
                    fontSize: 16.h,
                    fontWeight: TextStyles.medium,
                    fontFamily: TextStyles.poppinsEnglish,
                  ),
                ),
            SizedBox(height: 10.h),
          const   UpdateUploadImage(imageUrl: 'https://images.unsplash.com/photo-1576158113928-4c240eaaf360?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',),
            20.verticalSpace,
            TextApp(
              text: 'Update the Category Name',
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
              hintText: 'MacBook',
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (p0 == null || p0.isEmpty || p0.length < 2) {
                  return 'Please Selected Your Category Name';
                }
                return null;
              },
            ),
            20.verticalSpace,
            CustomButton(
              onPressed: () {},
              text: 'Update a new category',
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
