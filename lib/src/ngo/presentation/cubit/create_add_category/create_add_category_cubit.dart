
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/create_category/create_category_request.dart';
import 'package:vista_market/src/ngo/data/repo/categories_repo.dart';

part 'create_add_category_state.dart';
part 'create_add_category_cubit.freezed.dart';

class CreateAddCategoryCubit extends Cubit<CreateAddCategoryState> {
  CreateAddCategoryCubit(this._repo)
      : super(const CreateAddCategoryState.initial());
  final CategoriesRepo _repo;

  Future<void> createAddCategory(
      {required CreateCategoryRequest body,
      required BuildContext context,}) async {
    emit(const CreateAddCategoryState.loading());
    final result = await _repo.createCategory( context, body);
    result.when(
      success: (response) {
        emit(const CreateAddCategoryState.success());
      },
    error: (error) {
        emit(CreateAddCategoryState.failure(error: error));
      },
    );
  }
}
