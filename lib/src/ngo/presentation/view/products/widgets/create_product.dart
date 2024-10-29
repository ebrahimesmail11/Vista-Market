import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/custom_bottom_sheet.dart';
import 'package:vista_market/src/common/widgets/custom_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/create_product_bottom_sheet.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: context.tr.create_categories,
          theme: context.displaySmall!.copyWith(
            color: context.colors.textColor,
            fontSize: 18.h,
            fontWeight: TextStyles.medium,
            fontFamily: TextStyles.poppinsEnglish,
          ),
        ),
        CustomButton(
          text: context.tr.add,
          backgroundColor: context.colors.bluePinkDark,
          onPressed: () {
            CustomBottomSheet.showModelBottomSheetContainer(
              context: context,
              widget: const CreateProductBottomSheet(),
            );
          },
          height: 35.h,
          width: 90.w,
          lastRadius: 10,
          threeRadius: 10,
        ),
      ],
    );
  }
}
