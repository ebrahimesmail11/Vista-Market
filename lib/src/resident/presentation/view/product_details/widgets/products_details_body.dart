import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/customer/product_details/product_details_response.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_favorite_button.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_share_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/resident/presentation/cubit/cubit/share_cubit_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/product_details/widgets/products_details_image_slider.dart';

class ProductsDetailsBody extends StatelessWidget {
  const ProductsDetailsBody({required this.product, super.key});
  final ProductDetailsResponseProduct product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 BlocBuilder<ShareCubitCubit, ShareCubitState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () {
                          return CustomShareButton(
                            size: 30,
                            onPressed: () {
                              context.read<ShareCubitCubit>().shareProduct(
                                    productId:int.parse(product.id ?? ''),
                                    title:product.title ?? '',
                                    imageUrl: product.images?[0] ?? '',
                                  );
                            },
                          );
                        },
                        loading: (id) {
                          if (id == int.parse(product.id ?? '')) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: SizedBox(
                                height: 25.h,
                                width: 25.w,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else {
                            return CustomShareButton(
                              size: 30,
                              onPressed: () {},
                            );
                          }
                        },
                        success: () {
                          return CustomShareButton(
                            size: 30,
                            onPressed: () {
                              context.read<ShareCubitCubit>().shareProduct(
                                    productId:int.parse(product.id ?? ''),
                                    title:product.title ?? '',
                                    imageUrl: product.images?[0] ?? '',
                                  );
                            },
                          );
                        },
                      );
                    },
                  ),
                BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    return CustomFavoriteButton(
                      isFavorites: context.read<FavoritesCubit>().isFavorite(
                            product.id.toString(),
                          ),
                      onPressed: () async {
                        await context
                            .read<FavoritesCubit>()
                            .addAndRemoveFavorites(
                              id: product.id.toString(),
                              image: product.images?[0] ?? '',
                              title: product.title ?? '',
                              price: product.price.toString(),
                              categoryName: product.category?.name ?? '',
                            );
                      },
                      size: 30,
                    );
                  },
                ),
              ],
            ),
            10.verticalSpace,
            ProductsDetailsImageSlider(
              images: product.images ?? [],
            ),
            30.verticalSpace,
            TextApp(
              text: product.title ?? '',
              theme: context.displaySmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: TextStyles.bold,
                color: context.colors.textColor,
              ),
            ),
            15.verticalSpace,
            TextApp(
              text: product.description ?? '',
              theme: context.displaySmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: TextStyles.regular,
                color: context.colors.textColor,
                height: 1.5.h,
              ),
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
