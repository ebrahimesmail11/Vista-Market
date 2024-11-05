import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/create_product/create_product_request_body.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/custom_drop_down.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/cubit/create_product/create_product_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_categories/get_all_categories_cubit.dart';
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
  double? categoryId;
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
                keyboardType: TextInputType.number,
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
              BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (items) {
                      return CustomCreateDropDown(
                        items: items.categoriesListName,
                        hintText: 'Select a Category',
                        onChanged: (p0) {
                          setState(() {
                            categoryName = p0;
                            final categoryIdString = items.categoriesList
                                .firstWhere(
                                  (e) => e.name == p0,
                                )
                                .id!;
                            categoryId = double.parse(
                              categoryIdString,
                            );
                          });
                        },
                        value: categoryName,
                      );
                    },
                    orElse: () {
                      return CustomCreateDropDown(
                        items: const [''],
                        hintText: 'Select a Category',
                        onChanged: (p0) {
                        },
                        value: '',
                      );
                    },
                  );
                },
              ),
              15.verticalSpace,
              BlocConsumer<CreateProductCubit, CreateProductState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      context
                          .pop();
                      MotionToast.success(
                        description:  Text('${_titleController.text} created.'),
                        toastDuration: const Duration(seconds: 2),
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
                        onPressed: () {
                          _validateThenDoCreate(context);
                        },
                        text: 'Create  product',
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

  Future<void> _validateThenDoCreate(BuildContext context) async {
    final indexEmptyImage =
        context.read<UploadImageCubit>().images.indexWhere((e) => e.isNotEmpty);
    if (fromKey.currentState!.validate() ||
        indexEmptyImage == -1 ||
        categoryName == null) {
      if (indexEmptyImage == -1) {
        MotionToast.error(
          description: Text(context.tr.valid_pick_image),
        ).show(context);
      } else if (categoryName == null) {
        MotionToast.error(
          description: Text(context.tr.create_categories),
        ).show(context);
      }else {
      await context.read<CreateProductCubit>().createProduct(
            context,
            body: CreateProductRequestBody(
              title: _titleController.text.trim(),
              price: double.parse(_priceController.text.trim()),
              description: _descriptionController.text.trim(),
              categoryId: categoryId ?? 0,
              images: context.read<UploadImageCubit>().images,
            ),
          );
    }
    }
  }
}
