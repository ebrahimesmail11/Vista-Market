import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class UpdateProductImage extends StatelessWidget {
  const UpdateProductImage({required this.imageList, super.key});
  final List<String> imageList;
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
            loadingList: (indexId) {
              if (index == indexId) {
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
              } else {
                return UpdateSelectedWidget(
                  index: index,
                  imageList: imageList,
                  onTap: () {
                  },
                );
              }
            },
            orElse: () {
              return UpdateSelectedWidget(
                index: index,
                imageList: imageList,
                onTap: () async{
                  await context.read<UploadImageCubit>().updateImage(
                        context,
                        indexList: index,
                        productImageList: imageList,
                      );
                },
              );
            },
          );
        },
      ),
      itemCount: imageList.length,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 6.h,
        );
      },
    );
  }
}

class UpdateSelectedWidget extends StatelessWidget {
  const UpdateSelectedWidget({
    required this.index,
    required this.imageList,
    required this.onTap,
    super.key,
  });

  final List<String> imageList;
  final VoidCallback onTap;
  final int index ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 90.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                  imageList[index].imageProductFormat(),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 90.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
