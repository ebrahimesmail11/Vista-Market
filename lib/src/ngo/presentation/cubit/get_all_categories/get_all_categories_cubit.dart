import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/all_category/get_all_categories_response.dart';
import 'package:vista_market/src/ngo/data/repo/categories_repo.dart';

part 'get_all_categories_state.dart';
part 'get_all_categories_cubit.freezed.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this._repo)
      : super(
          const GetAllCategoriesState.loading(),
        );
  final CategoriesRepo _repo;

  Future<void> getAllCategories(BuildContext context,
      {required bool isNotLoading,}) async {
        if (isNotLoading) {
          emit(const GetAllCategoriesState.loading());
        }
    final result = await _repo.getAllCategories(context);
    result.when(
      success: (data) {
        if (data.categoriesList.isEmpty) {
          emit(const GetAllCategoriesState.empty());
        } else {
          emit(GetAllCategoriesState.success(categoriesList: data));
        }
      },
      error: (message) {
        emit(GetAllCategoriesState.failure(error: message));
      },
    );
  }
}
