import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/customer/product_details/product_details_response.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_favorite_button.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_share_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShareButton(
                  size: 30,
                ),
                CustomFavoriteButton(
                  size: 30,
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
