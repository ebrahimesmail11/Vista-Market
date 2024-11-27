import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_linear_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({required this.price, super.key});
  final double price;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 400,
      child: Container(
        height: 90.h,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: context.colors.containerShadow1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: '\$ $price',
                theme: context.displaySmall!.copyWith(
                  fontSize: 22.sp,
                  fontWeight: TextStyles.medium,
                  color: context.colors.bluePinkLight,
                ),
              ),
              CustomLinearButton(
                height: 40.h,
                width: 140.w,
                onPressed: () {},
                child: TextApp(
                  text: context.tr.add,
                  theme: context.displaySmall!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: TextStyles.bold,
                    color: context.colors.textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
