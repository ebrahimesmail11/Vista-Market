import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_app_bar.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_products_view_all/get_products_view_all_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/products_view_all/widgets/products_view_all_body.dart';

class ProductsViewAllScreen extends StatelessWidget {
  const ProductsViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetProductsViewAllCubit>()..getProductsViewAll(context),
      child: Scaffold(
        appBar: CustomAppBar(title: context.tr.view_all),
        body: const ProductsViewAllBody(),
      ),
    );
  }
}
