import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_app_bar.dart';

class ProductsViewAllScreen extends StatelessWidget {
  const ProductsViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.tr.view_all),
      body: Center(
        child: Text(context.tr.view_all),
      ),
    );
  }
}
