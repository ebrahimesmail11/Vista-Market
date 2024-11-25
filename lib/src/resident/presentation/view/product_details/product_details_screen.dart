import 'package:flutter/material.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.id, super.key});
  final int id;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'title'),
    );
  }
}
