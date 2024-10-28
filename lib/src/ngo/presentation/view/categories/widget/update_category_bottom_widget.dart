import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/update_category/update_category_request_body.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/cubit/update_category/update_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/widget/update_upload_image.dart';

class UpdateCategoryBottomWidget extends StatefulWidget {
  const UpdateCategoryBottomWidget({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    super.key,
  });
  final String categoryId;
  final String categoryName;
  final String categoryImage;

  @override
  State<UpdateCategoryBottomWidget> createState() =>
      _UpdateCategoryBottomWidgetState();
}

class _UpdateCategoryBottomWidgetState
    extends State<UpdateCategoryBottomWidget> {
  final fromKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.categoryName;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

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
            UpdateUploadImage(
              imageUrl: widget.categoryImage,
            ),
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
            BlocConsumer<UpdateCategoryCubit, UpdateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    MotionToast.success(
                      description: Text(
                        '${nameController.text} update Successfully',
                      ),
                    ).show(context);
                  },
                  failure: (error) {
                    MotionToast.error(description: Text(error)).show(context);
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
                        color: Colors.white,
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
                      onPressed: () async {
                        await _validateThenDoUpdate(context);
                      },
                      text: 'Update a new category',
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
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Future<void> _validateThenDoUpdate(BuildContext context) async {
    if (fromKey.currentState!.validate()) {
      await context.read<UpdateCategoryCubit>().updateCategory(
            context,
            body: UpdateCategoryRequestBody(
              id: widget.categoryId,
              name: nameController.text.trim(),
              image: context.read<UploadImageCubit>().getimageUrl.isEmpty
                  ? widget.categoryImage
                  : context.read<UploadImageCubit>().getimageUrl,
            ),
          );
    }
  }
}
