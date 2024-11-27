import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/network/models/all_category/get_all_categories_response.dart';

import 'package:vista_market/src/resident/presentation/view/home/widgets/categories/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({required this.categories, super.key});
  final List<GetAllCategoriesResponseCategories> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            image: categories[index].image ?? '',
            title: categories[index].name ?? '',
            id: int.parse(categories[index].id ?? ''),
          );
        },
        separatorBuilder: (context, index) => 10.horizontalSpace,
        itemCount: 7,
      ),
    );
  }
}
