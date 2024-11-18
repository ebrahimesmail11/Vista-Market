import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/update_product/update_product_request_body.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_drop_down.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_categories/get_all_categories_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/update_product/update_product_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/update_product_image.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({
    required this.imgList,
    required this.title,
    required this.price,
    required this.description,
    required this.productId,
    required this.categoryId,
    super.key,
  });
  final List<String> imgList;
  final String title;
  final String price;
  final String description;
  final String productId;
  final String categoryId;
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
  String? categoryValueId;
  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    priceController.text = widget.price;
    descriptionController.text = widget.description;
    categoryName = widget.categoryId;
    categoryValueId = widget.categoryId;
    context.read<GetAllCategoriesCubit>().getAllCategories(
          context,
          isNotLoading: false,
        );
  }

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
              UpdateProductImage(
                imageList: widget.imgList,
              ),
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
                  if (p0 == null || p0.isEmpty) {
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
                  if (p0 == null || p0.isEmpty) {
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
              BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (category) {
                      final uniqueCategories =
                          category.categoriesListName.toSet().toList();

                      // التأكد من أن القيمة الافتراضية موجودة
                      if (!uniqueCategories.contains(categoryName)) {
                        categoryName = uniqueCategories.isNotEmpty
                            ? uniqueCategories.first
                            : null;
                      }
                      return CustomCreateDropDown(
                        items: uniqueCategories,
                        hintText: '',
                        onChanged: (p0) {
                          setState(() {
                            categoryName = p0;
                            final categoryString = category.categoriesList
                                .firstWhere(
                                  (e) => e.name == p0,
                                )
                                .id;
                            categoryValueId = categoryString;
                          });
                        },
                        value: categoryName,
                      );
                    },
                    orElse: () {
                      return CustomCreateDropDown(
                        items: const [''],
                        hintText: '',
                        onChanged: (p0) {},
                        value: '',
                      );
                    },
                  );
                },
              ),
              15.verticalSpace,
              BlocConsumer<UpdateProductCubit, UpdateProductState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      context.pop();
                      MotionToast.success(
                        description: const Text(
                          'Your product has been updated.',
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
                        onPressed: () async {
                          // log('product id: ${widget.productId}');
                          // log('Title: ${titleController.text.trim()}');
                          // log('Price: ${priceController.text.trim()}');
                          // log(
                          //     'Description: ${descriptionController.text.trim()}');
                          // log('Category ID: $categoryValueId');
                          // log('images: ${context.read<UploadImageCubit>().updateProductImage}');
                          await _validUpdateProduct();
                          // log('product id: ${widget.productId}');
                          // log('Title: ${titleController.text}');
                          // log('Price: ${priceController.text}');
                          // log(
                          //     'Description: ${descriptionController.text.trim()}');
                          // log('Category ID: $categoryValueId');
                          // log('images: ${context.read<UploadImageCubit>().updateProductImage}');
                        },
                        text: 'Update  product',
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
      ),
    );
  }

  Future<void> _validUpdateProduct() async {
    if (fromKey.currentState!.validate()) {
      // Ensure categoryValueId is not null or empty
      if (categoryValueId == null || categoryValueId!.isEmpty) {
        MotionToast.error(
          description: const Text(
            'Invalid category ID. Please select a valid category.',
          ),
        ).show(context);
        return;
      }

      // التحقق من القيمة المدخلة
      final categoryIdDouble = double.tryParse(categoryValueId!);
      if (categoryIdDouble == null) {
        MotionToast.error(
          description: const Text(
            'Invalid category ID. Please select a valid numeric category.',
          ),
        ).show(context);
        return;
      }

      await context.read<UpdateProductCubit>().updateProduct(
            context,
            body: UpdateProductRequestBody(
              productId: widget.productId,
              title: titleController.text.trim(),
              price: double.parse(priceController.text.trim()),
              description: descriptionController.text.trim(),
              categoryId: categoryIdDouble,
              images:
                  context.read<UploadImageCubit>().updateProductImage.isEmpty
                      ? widget.imgList
                      : context.read<UploadImageCubit>().updateProductImage,
            ),
          );
    }
  }
}
