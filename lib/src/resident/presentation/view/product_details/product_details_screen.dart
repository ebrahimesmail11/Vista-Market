import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_app_bar.dart';
import 'package:vista_market/src/resident/presentation/cubit/cubit/get_product_details_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/product_details/widgets/add_to_cart_button.dart';
import 'package:vista_market/src/resident/presentation/view/product_details/widgets/product_details_custom_painter.dart';
import 'package:vista_market/src/resident/presentation/view/product_details/widgets/products_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.id, super.key});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetProductDetailsCubit>()..getProductDetails(context, id: id),
      child: BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: (){
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (data){
                return Scaffold(
            appBar:  CustomAppBar(title: data.title??''),
            bottomNavigationBar:  AddToCartButton(
              price: data.price??0,
            ),
            body: Stack(
              children: [
                CustomPaint(
                  size: Size(
                    MediaQuery.sizeOf(context).width,
                    MediaQuery.sizeOf(context).height,
                  ),
                  painter: ProductDetailsCustomPainter(
                    gradient: LinearGradient(
                      colors: [
                        context.colors.bluePinkLight!,
                        context.colors.bluePinkDark!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                 ProductsDetailsBody(
                  product: data,
                 ),
              ],
            ),
          );
            },
            failure: (error){
              return Center(child: Text(error),);
            },

          );
        },
      ),
    );
  }
}
