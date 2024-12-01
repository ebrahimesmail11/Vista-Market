import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_product_item.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_products_view_all/get_products_view_all_cubit.dart';

class ProductsViewAllBody extends StatefulWidget {
  const ProductsViewAllBody({super.key});

  @override
  State<ProductsViewAllBody> createState() => _ProductsViewAllBodyState();
}

class _ProductsViewAllBodyState extends State<ProductsViewAllBody> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        context.read<GetProductsViewAllCubit>().handlerPaganation(
              context,
              scrollController: _scrollController,
              loadMorePosition: MediaQuery.sizeOf(context).height * .15,
            );
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsViewAllCubit, GetProductsViewAllState>(
      builder: (context, state) {
        if (state is GetProductsViewAllStateLoading &&
            state.productsList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetProductsViewAllStateFailure) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 15,
                    childAspectRatio: 165 / 250,
                  ),
                  itemCount: state.productsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CustomProductItem(
                      imageUrl: state.productsList[index].images?[0] ?? '',
                      title: state.productsList[index].title ?? '',
                      categoryName:
                          state.productsList[index].category?.name ?? '',
                      price: state.productsList[index].price ?? 0,
                      productId: int.parse(state.productsList[index].id ?? ''),
                    );
                  },
                ),
              ),
              if (state is GetProductsViewAllStateLoading &&
                  state.productsList.isNotEmpty)
                Center(
                  child: CircularProgressIndicator(
                    color: context.colors.textColor,
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
