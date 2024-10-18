import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class AdminAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBarWidget(
      {
      required this.title,
      required this.backgroundColor,
      required this.isMain,
      super.key,});
  final String title;
  final Color backgroundColor;
  final bool isMain;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: TextApp(
        text: title,
        theme: context.displaySmall!.copyWith(
          fontSize: 18.h,
          fontFamily: TextStyles.poppinsEnglish,
          fontWeight: TextStyles.bold,
          color: context.colors.textColor,
        ),
      ),
      leading: isMain? IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: const Icon(Icons.menu),
        color: context.colors.textColor,
      ) : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
