import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class UserAvtar extends StatelessWidget {
  const UserAvtar({super.key});

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
        final isImageUploaded =
            context.read<UploadImageCubit>().getimageUrl.isNotEmpty;
        return state.maybeWhen(
          loading: () {
            return CircleAvatar(
              radius: 120.r,
              backgroundImage: const AssetImage(AppImages.userAvtar),
              child: Center(
                child: CircularProgressIndicator(
                  color: context.colors.mainColor,
                ),
              ),
            );
          },
          orElse: () {
            return CustomFadeInDown(
              duration: 500,
              child: SizedBox(
                child: CircleAvatar(
                  radius: 120.r,
                  backgroundImage: isImageUploaded
                      ? NetworkImage(
                          context.read<UploadImageCubit>().getimageUrl,
                        )
                      : const AssetImage(
                          AppImages.userAvtar,
                        ),
                  backgroundColor: Colors.black.withOpacity(0.2),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      if (isImageUploaded)
                        Positioned(
                          top: 10,
                          right: 50,
                          child: Container(
                            height: 50.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                context.read<UploadImageCubit>().removeImage();
                              },
                              color: Colors.red,
                              icon: const Icon(Icons.delete, size: 20),
                            ),
                          ),
                        ),
                      Positioned(
                        bottom: 10,
                        left: 50,
                        child: Container(
                          height: 50.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<UploadImageCubit>()
                                  .uploadImage(context);
                            },
                            color: Colors.white,
                            icon: const Icon(Icons.add_a_photo, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
