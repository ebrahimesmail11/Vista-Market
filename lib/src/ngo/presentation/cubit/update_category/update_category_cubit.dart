import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/update_category/update_category_request_body.dart';
import 'package:vista_market/src/ngo/data/repo/categories_repo.dart';

part 'update_category_state.dart';
part 'update_category_cubit.freezed.dart';

class UpdateCategoryCubit extends Cubit<UpdateCategoryState> {
  UpdateCategoryCubit(this._repo) : super(const UpdateCategoryState.initial());
  final CategoriesRepo _repo;
  Future<void> updateCategory(
    BuildContext context, {
    required UpdateCategoryRequestBody body,
  }) async{
    emit(const UpdateCategoryState.loading());
    final result =await _repo.updateCategory(context, body: body);
    result.when(
      success: (_) {
        emit(const UpdateCategoryState.success());
      },
      error: (error) {
        emit(UpdateCategoryState.failure(error: error));
      },
    );
  }
}
