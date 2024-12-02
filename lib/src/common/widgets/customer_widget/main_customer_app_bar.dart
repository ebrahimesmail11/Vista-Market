import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/app_images.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/nav_bar_enum.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/common/widgets/custom_linear_button.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/resident/presentation/cubit/main_nav_bar/main_cubit_cubit.dart';

class MainCustomerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MainCustomerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<MainCubitCubit>();
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: context.colors.mainColor,
      title: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if(cubit.navBarEnum == NavBarEnum.home){
            return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFadeInRight(
                duration: 800,
                child: TextApp(
                  text: context.tr.choose_products,
                  theme: context.displaySmall!.copyWith(
                    color: context.colors.textColor,
                    fontSize: 20.h,
                    fontWeight: TextStyles.bold,
                    fontFamily: TextStyles.poppinsEnglish,
                  ),
                ),
              ),
              CustomFadeInLeft(
                duration: 800,
                child: CustomLinearButton(
                  onPressed: () {
                    context.pushNamed(Routes.searchScreen);
                  },
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.search,
                    ),
                  ),
                ),
              ),
            ],
          );
          }else{
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
