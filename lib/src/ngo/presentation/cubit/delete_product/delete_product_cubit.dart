import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/ngo/data/repo/products_repo.dart';

part 'delete_product_state.dart';
part 'delete_product_cubit.freezed.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit(this._repo) : super(const DeleteProductState.initial());
  final ProductsRepo _repo;

  Future<void> deleteProduct(BuildContext context,
      {required String productId,}) async {
    emit(DeleteProductState.loading(productId: productId));
    final result = await _repo.deleteProduct(productId: productId, context);
    result.when(
      success: (response) {
        emit(const DeleteProductState.success());
      },
      error: (error) {
        emit(DeleteProductState.failure(error: error));
      },
    );
  }
}
