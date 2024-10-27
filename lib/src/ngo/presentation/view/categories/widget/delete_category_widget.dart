import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/ngo/presentation/cubit/delete_category/delete_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_categories/get_all_categories_cubit.dart';

class DeleteCategoryWidget extends StatelessWidget {
  const DeleteCategoryWidget({
    required this.categoryId,
    super.key,
  });
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context
                .read<GetAllCategoriesCubit>()
                .getAllCategories(context, isNotLoading: false);
            MotionToast.success(
              description: const Text('Your category has been deleted.'),
            ).show(context);
          },
          failure: (error) {
            MotionToast.error(description: Text(error)).show(context);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (id == categoryId) {
               return SizedBox(
              height: 15.h,
              width: 15.w,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
            }else{
               return  Icon(
                Icons.delete,
                color: Colors.red,
                size: 25.h,
              );
            }
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context
                    .read<DeleteCategoryCubit>()
                    .deleteCategory(context, categoryId: categoryId);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 25.h,
              ),
            );
          },
        );
      },
    );
  }
}
