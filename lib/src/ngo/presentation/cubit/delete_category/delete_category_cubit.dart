import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/ngo/data/repo/categories_repo.dart';

part 'delete_category_state.dart';
part 'delete_category_cubit.freezed.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit(this._repo) : super(const DeleteCategoryState.initial());
  final CategoriesRepo _repo;
  Future<void> deleteCategory(BuildContext context,
      {required String categoryId,}) async {
    emit( DeleteCategoryState.loading(categoryId: categoryId));
    final result = await _repo.deleteCategory(
      context,
      categoryId: categoryId,
    );
    result.when(
      success: (response) {
        emit(const DeleteCategoryState.success());
      },
      error: (error) {
        emit(
          DeleteCategoryState.failure(
            error: error,
          ),
        );
      },
    );
  }
}
