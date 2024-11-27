import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_container_linear_customer.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_favorite_button.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_share_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem(
      {required this.imageUrl,
      required this.title,
      required this.categoryName,
      required this.price,
      required this.productId,
      super.key,});
  final String imageUrl;
  final String title;
  final String categoryName;
  final double price;
  final int  productId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       await context.pushNamed(Routes.productDetails, arguments: productId);
      },
      child: CustomContainerLinearCustomer(
        height: 250.h,
        width: 165.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomShareButton(size: 25,),
                  CustomFavoriteButton(size: 25,),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Hero(
                  tag: 'image_$productId',
                  child: CachedNetworkImage(
                    height: 200.h,
                    width: 120.w,
                    imageUrl: imageUrl.imageProductFormat(),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 200.h,
                        width: 120.w,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 70,
                    ),
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: title,
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 16.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
                maxLines: 1,
              ),
            ),
            5.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: categoryName,
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 13.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: '\$ $price',
                theme: context.displaySmall!.copyWith(
                  color: context.colors.textColor,
                  fontSize: 13.h,
                  fontWeight: TextStyles.medium,
                  fontFamily: TextStyles.poppinsEnglish,
                ),
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
