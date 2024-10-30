import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_drop_down.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/create_product_image.dart';

class CreateProductBottomSheet extends StatefulWidget {
  const CreateProductBottomSheet({super.key});

  @override
  State<CreateProductBottomSheet> createState() =>
      _CreateProductBottomSheetState();
}

class _CreateProductBottomSheetState extends State<CreateProductBottomSheet> {
  final fromKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? categoryName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Form(
        key: fromKey,
        child: SingleChildScrollView(
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
              TextApp(
                text: 'Create a photo',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 16.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
              SizedBox(height: 10.h),
              const CreateProductImage(),
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
                controller: _titleController,
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
                controller: _priceController,
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
                controller: _descriptionController,
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
                items: const [],
                hintText: 'Select a Category',
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
                text: 'Create  product',
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
