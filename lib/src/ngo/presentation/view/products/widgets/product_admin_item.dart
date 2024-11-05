import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_container_linear_admin.dart';
import 'package:vista_market/src/common/widgets/custom_bottom_sheet.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/delete_product_widget.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/update_product_bottom_sheet.dart';

class ProductAdminItem extends StatelessWidget {
  const ProductAdminItem({
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    required this.productId,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String categoryName;
  final String price;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DeleteProductWidget(productId: productId),
                IconButton(
                  onPressed: () {
                    CustomBottomSheet.showModelBottomSheetContainer(
                      context: context,
                      widget: const UpdateProductBottomSheet(),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
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
    );
  }
}


