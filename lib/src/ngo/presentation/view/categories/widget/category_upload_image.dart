import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
         state.whenOrNull(
          success: () {
            MotionToast.success(description: Text(context.tr.image_uploaded))
                .show(context);
          },
          removeImage: (removeImage) {
            MotionToast.error(
              description: Text(context.tr.image_removed),
            ).show(context);
          },
          failure: (error) {
            MotionToast.error(description: Text(error)).show(context);
          },
        );
      },
      builder: (context, state) {
        final cubit=context.read<UploadImageCubit>();
        return state.maybeWhen(
          loading: (){
            return Container(
              height: 120.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
              ),),
             
            );
          },
          orElse: (){
            if(cubit.getimageUrl.isNotEmpty) {
              return Container(
                height: 120.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  image:  DecorationImage(
                    image: NetworkImage(
                      cubit.getimageUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }else{
              return InkWell(
          onTap: () {
            context.read<UploadImageCubit>().uploadImage(context);
          },
          child: Container(
            height: 120.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.add_a_photo_outlined,
              size: 50.h,
              color: Colors.white,
            ),
          ),
        );
            }
          },
        );
      },
    );
  }
}
