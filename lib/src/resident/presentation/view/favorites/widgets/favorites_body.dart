import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_product_item.dart';
import 'package:vista_market/src/resident/presentation/cubit/favorites/favorites_cubit.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (context.read<FavoritesCubit>().favoritesList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: context.colors.textColor,
                  size: 50.r,
                ),
              ],
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 15,
                childAspectRatio: 165 / 250,
              ),
              itemCount: context.read<FavoritesCubit>().favoritesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final productList =
                    context.read<FavoritesCubit>().favoritesList;
                return CustomProductItem(
                  imageUrl: productList[index].image,
                  title: productList[index].title ,
                  categoryName: productList[index].categoryName,
                  price:double.parse( productList[index].price),
                  productId: int.parse(productList[index].id),
                );
              },
            );
          }
        },
      ),
    );
  }
}
