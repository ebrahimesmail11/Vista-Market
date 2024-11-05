import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/update_product/update_product_request_body.dart';
import 'package:vista_market/src/ngo/data/repo/products_repo.dart';

part 'update_product_state.dart';
part 'update_product_cubit.freezed.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit(this._repo) : super(const UpdateProductState.initial());
  final ProductsRepo _repo;

  Future<void> updateProduct(
    BuildContext context, {
    required UpdateProductRequestBody body,
  }) async {
    emit(const UpdateProductState.loading());
    final result = await _repo.updateProduct(context, body: body);
    result.when(
      success: (response) {
        emit(const UpdateProductState.success());
      },
      error: (error) {
        emit(UpdateProductState.failure(error: error));
      },
    );
  }
}
