import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/admin_widget/admin_app_bar_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.colors.mainColor,
      appBar: AdminAppBarWidget(
        isMain: true,
        backgroundColor: context.colors.mainColor!,
        title: 'Users',
      ),
      body: const Center(child: Text('Users'),),
    );
  }
}
