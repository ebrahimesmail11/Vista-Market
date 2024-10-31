import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/admin_widget/admin_app_bar_widget.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_products/get_all_products_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/products_body.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAllProductsCubit>()
            ..getAllProducts(
              context,
              isNotLoading: true,
            ),
        ),
      ],
      child: Scaffold(
        backgroundColor: context.colors.mainColor,
        appBar: AdminAppBarWidget(
          isMain: true,
          backgroundColor: context.colors.mainColor!,
          title: 'Products',
        ),
        body: const ProductsBody(),
      ),
    );
  }
}
