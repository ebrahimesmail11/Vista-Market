import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/admin_drawer/admin_drawer_model.dart';
import 'package:vista_market/src/common/widgets/admin_app_bar_widget.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/dash_board_screen.dart';

class HomePageScreenAdmin extends StatefulWidget {
  const HomePageScreenAdmin({super.key});

  @override
  State<HomePageScreenAdmin> createState() => _HomePageScreenAdminState();
}

class _HomePageScreenAdminState extends State<HomePageScreenAdmin> {
  Widget page = const DashBoardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return  MenueAdminScreen(
            onPageChanged: (p0) {
              setState(() {
                page = p0;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24.r,
      showShadow: true,
      drawerShadowsBackgroundColor: context.colors.mainColor!.withOpacity(0.6),
      menuBackgroundColor: context.colors.bluePinkDark!,
    );
  }
}

class MenueAdminScreen extends StatelessWidget {
  const MenueAdminScreen({required this.onPageChanged, super.key});
  final void Function(Widget) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bluePinkDark,
      appBar: AdminAppBarWidget(
        isMain: false,
        backgroundColor: context.colors.bluePinkDark!,
        title: context.tr.app_name,
      ),
      body: Column(
        children: adminDrawerList
            .call(context)
            .map(
              (e) => ListTile(
                onTap: () {
                  onPageChanged(e.page);
                },
                title: e.title,
                leading: e.icon,
              ),
            )
            .toList(),
      ),
    );
  }
}
