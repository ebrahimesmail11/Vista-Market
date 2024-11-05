
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/create_product/create_product_request_body.dart';
import 'package:vista_market/src/ngo/data/repo/products_repo.dart';

part 'create_product_state.dart';
part 'create_product_cubit.freezed.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit(this._repo) : super(const CreateProductState.initial());
  final ProductsRepo _repo;
  Future<void> createProduct(
    BuildContext context,{
    required CreateProductRequestBody body,
  }) async {
    emit(const CreateProductState.loading());
    final result = await _repo.createProduct(context, body);
    result.when(
      success: (response) {
        emit(const CreateProductState.success());
      },
      error: (error) {
        emit(CreateProductState.failure(error: error));
      },
    );
  }
}
