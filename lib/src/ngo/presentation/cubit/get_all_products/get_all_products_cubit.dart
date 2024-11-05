import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/ngo/data/repo/products_repo.dart';

part 'get_all_products_state.dart';
part 'get_all_products_cubit.freezed.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this._repo) : super(const GetAllProductsState.loading());
  final ProductsRepo _repo;

  Future<void> getAllProducts(BuildContext context,
      {required bool isNotLoading,}) async {
    if (isNotLoading) {
      emit(const GetAllProductsState.loading());
    }
    final result = await _repo.getAllProducts(context);
    result.when(
      success: (data) {
       
        if (data.products.isEmpty) {
          emit(const GetAllProductsState.empty());
        } else {
          emit(GetAllProductsState.success(productsList: data.products));
        }
      },
      error: (message) {
        emit(GetAllProductsState.failure(error: message));
      },
    );
      }
}
