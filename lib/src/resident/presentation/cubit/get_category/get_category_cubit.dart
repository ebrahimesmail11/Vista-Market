import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/resident/data/repo/category_repo.dart';

part 'get_category_state.dart';
part 'get_category_cubit.freezed.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit(this._repo) : super(const GetCategoryState.loading());
  final CategoryRepo _repo;
  Future<void> getCategory(
    BuildContext context, {
    required int categoryId,
  }) async {
    emit(const GetCategoryState.loading());
    final result = await _repo.getCategory(categoryId: categoryId, context);
    result.when(
      success: (data) {
        if (data.products.isEmpty) {
          emit(const GetCategoryState.empty());
        } else {
          emit(GetCategoryState.success(productsList: data.products));
        }
      },
      error: (message) {
        emit(GetCategoryState.failure(error: message));
      },
    );
  }
}
