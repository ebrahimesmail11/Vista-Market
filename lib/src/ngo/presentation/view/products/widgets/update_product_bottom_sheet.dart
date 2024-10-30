import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_drop_down.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/update_product_image.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({super.key});

  @override
  State<UpdateProductBottomSheet> createState() =>
      _UpdateProductBottomSheetState();
}

class _UpdateProductBottomSheetState extends State<UpdateProductBottomSheet> {
  final fromKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? categoryName;
  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextApp(
                  text: 'Update Product',
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
                    text: 'Update a photo',
                    theme: context.displaySmall!.copyWith(
                      color: context.colors.textColor,
                      fontSize: 16.h,
                      fontWeight: TextStyles.medium,
                      fontFamily: TextStyles.poppinsEnglish,
                    ),
                  ),
              SizedBox(height: 10.h),
              const UpdateProductImage(),
              15.verticalSpace,
              TextApp(
                text: 'Title',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 16.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
              10.verticalSpace,
              CustomTextField(
                controller: titleController,
                hintText: 'title',
                keyboardType: TextInputType.emailAddress,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty || p0.length < 2) {
                    return 'Please Selected Your Product Name';
                  }
                  return null;
                },
              ),
              15.verticalSpace,
              TextApp(
                text: 'Price',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 16.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
              10.verticalSpace,
              CustomTextField(
                controller: priceController,
                hintText: 'Price',
                keyboardType: TextInputType.emailAddress,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty || p0.length < 2) {
                    return 'Please Selected Your Product Name';
                  }
                  return null;
                },
              ),
              15.verticalSpace,
              TextApp(
                text: 'Description',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 16.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
              10.verticalSpace,
              CustomTextField(
                controller: descriptionController,
                hintText: 'description',
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty || p0.length < 2) {
                    return 'Please Selected Your Product Name';
                  }
                  return null;
                },
              ),
              15.verticalSpace,
              TextApp(
                text: 'Category',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 16.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
              10.verticalSpace,
              CustomCreateDropDown(
                items: const ['Mobile', 'Laptop', 'Tablet'],
                hintText: 'MacBook',
                onChanged: (p0) {
                  setState(() {
                    categoryName = p0;
                  });
                },
                value: categoryName,
              ),
              15.verticalSpace,
              CustomButton(
                onPressed: () {},
                text: 'Update  product',
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
      ),
    );
  }
}
