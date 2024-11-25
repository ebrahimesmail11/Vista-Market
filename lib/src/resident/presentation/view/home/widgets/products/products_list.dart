import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_product_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({required this.productsList , super.key});
final List<AllProductsResponseProduct> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 15,
        childAspectRatio: 165 / 250,
      ),
      itemCount: 14,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return  CustomProductItem(
          imageUrl: productsList[index].images?[0] ?? '',
          title: productsList[index].title ?? '',
          categoryName: productsList[index].category?.name ?? '',
          price: productsList[index].price ?? 0,
          productId: int.parse(productsList[index].id ?? ''), 
        );
      },
    );
  }
}
