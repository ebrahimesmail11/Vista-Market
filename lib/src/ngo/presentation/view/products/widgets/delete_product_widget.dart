import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/ngo/presentation/cubit/delete_product/delete_product_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_products/get_all_products_cubit.dart';

class DeleteProductWidget extends StatelessWidget {
  const DeleteProductWidget({
    required this.productId,
    super.key,
  });
  final String productId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteProductCubit, DeleteProductState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context
                .read<GetAllProductsCubit>()
                .getAllProducts(context, isNotLoading: false);
            MotionToast.success(
              description: const Text('Your product has been deleted.'),
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
            if (id == productId) {
              return SizedBox(
                height: 15.h,
                width: 15.w,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 25,
                  color: Colors.red,
                ),
              );
            }
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context
                    .read<DeleteProductCubit>()
                    .deleteProduct(context, productId: productId);
              },
              icon: const Icon(
                Icons.delete,
                size: 25,
                color: Colors.red,
              ),
            );
          },
        );
      },
    );
  }
}
