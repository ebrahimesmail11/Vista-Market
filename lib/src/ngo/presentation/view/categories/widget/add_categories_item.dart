import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/admin_widget/custom_container_linear_admin.dart';
import 'package:vista_market/src/common/widgets/custom_bottom_sheet.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/widget/update_category_bottom_widget.dart';

class AddCategoriesItem extends StatelessWidget {
  const AddCategoriesItem({
    required this.name,
    required this.image,
    required this.categoriesId,
    super.key,
  });
  final String name;
  final String image;
  final String categoriesId;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 160.h,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  TextApp(
                    text: name,
                    theme: context.displaySmall!.copyWith(
                      color: context.colors.textColor,
                      fontSize: 18.h,
                      fontWeight: TextStyles.medium,
                      fontFamily: TextStyles.poppinsEnglish,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25.h,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          CustomBottomSheet.showModelBottomSheetContainer(
                              context: context,
                              widget: const UpdateCategoryBottomWidget(),);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.green,
                          size: 25.h,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: CachedNetworkImage(
                height: 90.h,
                width: 120.w,
                imageUrl: image,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 90.h,
                    width: 120.w,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 50.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
