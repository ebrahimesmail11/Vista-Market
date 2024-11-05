import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class CreateProductImage extends StatelessWidget {
  const CreateProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.zero,
      itemBuilder: (context, index) =>
          BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              MotionToast.success(description: Text(context.tr.image_uploaded))
                  .show(context);
            },
            failure: (error) {
              MotionToast.error(description: Text(error)).show(context);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loadingList: (indexlist) {
              if (indexlist == index) {
                return Container(
                  height: 90.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              }
              return SelectYourProductImage(
                index: index,
                onTap: () {},
              );
            },
            orElse: () {
              return SelectYourProductImage(
                index: index,
                onTap: () {
                  context
                      .read<UploadImageCubit>()
                      .uploadImageList(indexList: index, context);
                },
              );
            },
          );
        },
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 6.h,
      ),
      itemCount: 3,
    );
  }
}

class SelectYourProductImage extends StatelessWidget {
  const SelectYourProductImage({
    required this.onTap,
    required this.index,
    super.key,
  });
  final int index;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
     final images = context.read<UploadImageCubit>().images[index];
    return images.isNotEmpty 
        ? Container(
            height: 90.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                  context.read<UploadImageCubit>().images[index],
                ),
                fit: BoxFit.fill,
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              height: 90.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.add_a_photo_outlined,
                color: Colors.white,
                size: 50.sp,
              ),
            ),
          );
  }
}
