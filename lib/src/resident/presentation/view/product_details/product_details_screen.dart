import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_app_bar.dart';
import 'package:vista_market/src/resident/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_product_details/get_product_details_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/share/share_cubit_cubit.dart';

import 'package:vista_market/src/resident/presentation/view/product_details/widgets/add_to_cart_button.dart';
import 'package:vista_market/src/resident/presentation/view/product_details/widgets/product_details_custom_painter.dart';
import 'package:vista_market/src/resident/presentation/view/product_details/widgets/products_details_body.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({required this.productId, super.key});
  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool _isDialogShown = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetProductDetailsCubit>()
            ..getProductDetails(context, productId: widget.productId),
        ),
        BlocProvider(create: (context) => getIt<FavoritesCubit>()),
        BlocProvider(create: (context) => getIt<ShareCubitCubit>()),
      ],
      child: BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (data) {
              return Scaffold(
                appBar: CustomAppBar(title: data.title ?? ''),
                bottomNavigationBar: AddToCartButton(
                  price: data.price ?? 0,
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
            failure: (error) {
              if (!_isDialogShown) {
                _isDialogShown = true;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showErrorDialog(context, error);
                });
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // منع الإغلاق عند الضغط خارج الحوار
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.tr.error_msg),
          content: Text(
            message,
            style: context.displaySmall!.copyWith(
              fontSize: 18.sp,
              color: context.colors.textColor,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // إغلاق الـ Dialog
                Navigator.pop(context); // الرجوع إلى الشاشة السابقة
              },
              child: Text(context.tr.back),
            ),
          ],
        );
      },
    );
  }
}
