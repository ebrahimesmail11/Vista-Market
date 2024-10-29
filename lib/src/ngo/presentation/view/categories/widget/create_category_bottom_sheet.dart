import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/create_category/create_category_request.dart';

import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/cubit/create_add_category/create_add_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/widget/category_upload_image.dart';

class CreateCategoryBottomSheet extends StatefulWidget {
  const CreateCategoryBottomSheet({super.key});

  @override
  State<CreateCategoryBottomSheet> createState() =>
      _CreateCategoryBottomSheetState();
}

class _CreateCategoryBottomSheetState extends State<CreateCategoryBottomSheet> {
  final TextEditingController nameController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
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
                text: 'Create Category',
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
                BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    final cubit = context.read<UploadImageCubit>();
                    if (cubit.getimageUrl.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return CustomButton(
                      onPressed: () async {
                        cubit.removeImage();
                      },
                      text: ' Remove',
                      width: 120.w,
                      height: 35.h,
                      lastRadius: 10,
                      threeRadius: 10,
                      textAlign: TextAlign.center,
                      backgroundColor: Colors.red,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const CategoryUploadImage(),
            20.verticalSpace,
            TextApp(
              text: 'Enter the Category Name',
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
                  return 'Please Selected Your Category Name';
                }
                return null;
              },
            ),
            20.verticalSpace,
            BlocConsumer<CreateAddCategoryCubit, CreateAddCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    MotionToast.success(
                      description: Text(
                        '${nameController.text} Created Successfully',
                      ),
                    ).show(context);
                  },
                  failure: (error) {
                    MotionToast.error(
                      description: Text(error),
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
                      onPressed: () {
                        _validateThenDoCreate(context);
                      },
                      text: 'Create a new category',
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

  Future<void> _validateThenDoCreate(BuildContext context) async {
    if (fromKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getimageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getimageUrl.isEmpty){
         MotionToast.error(description: Text(context.tr.valid_pick_image))
          .show(context);
      }else {
      final cubit = context.read<CreateAddCategoryCubit>();
      await cubit.createAddCategory(
        body: CreateCategoryRequest(
          name: nameController.text.trim(),
          image: context.read<UploadImageCubit>().getimageUrl,
        ),
        context: context,
      );
    }
     
    }
  }
}
