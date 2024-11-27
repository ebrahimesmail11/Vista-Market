import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_container_linear_customer.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.id,
    required this.title,
    required this.image,
    super.key,
  });
  final String image;
  final String title;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.categoryScreen,
          arguments: (
            categoryId: id,
            categoryName: title,
          ),
        );
      },
      child: Column(
        children: [
          CustomContainerLinearCustomer(
            height: 71.h,
            width: 71.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                imageUrl: image.imageProductFormat(),
                fit: BoxFit.fill,
                height: 71.h,
                width: 71.w,
                placeholder: (context, url) => const SizedBox.shrink(),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 30.sp,
                ),
              ),
            ),
          ),
          10.verticalSpace,
          SizedBox(
            height: 31.h,
            width: 75.w,
            child: TextApp(
              text: title,
              theme: context.displaySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: TextStyles.bold,
                color: context.colors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
