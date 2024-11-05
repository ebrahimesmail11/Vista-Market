import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/admin_widget/empty_screen.dart';
import 'package:vista_market/src/common/widgets/loading_shimmer.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_products/get_all_products_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/create_product.dart';
import 'package:vista_market/src/ngo/presentation/view/products/widgets/product_admin_item.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          const CreateProduct(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await context.read<GetAllProductsCubit>().getAllProducts(
                      isNotLoading: true,
                      context,
                    );
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () {
                          return SliverToBoxAdapter(
                            child: GridView.builder(
                              gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 15,
                                childAspectRatio: 165 / 250,
                              ),
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return LoadingShimmer(
                                  height: 220.h,
                                  width: 150.w,
                                  borderRadius: 10,
                                );
                              },
                            ),
                          );
                        },
                        success: (data) {
                          return SliverToBoxAdapter(
                            child: GridView.builder(
                              gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 15,
                                childAspectRatio: 165 / 250,
                              ),
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ProductAdminItem(
                                  productId: data[index].id ?? '',
                                  imageUrl: data[index].images?.first ?? '',
                                  categoryName:
                                      data[index].category!.name ?? '',
                                  price: data[index].price!.toString(),
                                  title: data[index].title ?? '',
                                );
                              },
                            ),
                          );
                        },
                        empty: EmptyScreen.new,
                        failure: Text.new,
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
