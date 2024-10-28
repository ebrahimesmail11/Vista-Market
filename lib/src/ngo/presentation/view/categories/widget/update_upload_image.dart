import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class UpdateUploadImage extends StatelessWidget {
  const UpdateUploadImage({required this.imageUrl, super.key});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            return MotionToast.success(
              description: Text(context.tr.image_uploaded),
            ).show(context);
          },
          failure: (error) {
            MotionToast.error(description: Text(error)).show(context);
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state.maybeWhen(
          loading: () {
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
                ),
              ),
            );
          },
          orElse: () {
            return InkWell(
              onTap: () {
                cubit.uploadImage(context);
              },
              child: Stack(
                children: [
                  Container(
                    height: 120.h,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          cubit.getimageUrl.isEmpty
                              ? imageUrl
                              : cubit.getimageUrl,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  if (cubit.getimageUrl.isEmpty)
                    Container(
                      height: 120.h,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 40.sp,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
