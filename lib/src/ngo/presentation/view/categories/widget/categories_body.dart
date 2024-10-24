import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/widget/add_categories_item.dart';
import 'package:vista_market/src/ngo/presentation/view/categories/widget/create_categories.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          const CreateCategories(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const AddCategoriesItem(
                          name: 'Grocery',
                          image:
                              'https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-1170x780.jpg',
                          categoriesId: '1',
                        );
                      },
                      itemCount: 3,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
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
