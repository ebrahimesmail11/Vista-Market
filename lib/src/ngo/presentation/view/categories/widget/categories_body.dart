import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/admin_widget/empty_screen.dart';
import 'package:vista_market/src/common/widgets/loading_shimmer.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_categories/get_all_categories_cubit.dart';
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
              onRefresh: () async {
                await context.read<GetAllCategoriesCubit>().getAllCategories(
                      context,
                      isNotLoading: true,
                    );
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllCategoriesCubit,
                        GetAllCategoriesState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return LoadingShimmer(
                                  height: 130.h,
                                  borderRadius: 15,
                                );
                              },
                              itemCount: 3,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15.h,
                                );
                              },
                            );
                          },
                          success: (data) {
                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AddCategoriesItem(
                                  name: data.categoriesList[index].name ?? '',
                                  image: data.categoriesList[index].image ?? '',
                                  categoriesId:
                                      data.categoriesList[index].id ?? '',
                                );
                              },
                              itemCount: data.categoriesList.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15.h,
                                );
                              },
                            );
                          },
                          empty: EmptyScreen.new,
                          failure: Text.new,
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
