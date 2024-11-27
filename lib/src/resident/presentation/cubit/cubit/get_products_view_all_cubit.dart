import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/resident/data/repo/products_view_all_repo.dart';

part 'get_products_view_all_state.dart';
part 'get_products_view_all_cubit.freezed.dart';

class GetProductsViewAllCubit extends Cubit<GetProductsViewAllState> {
  GetProductsViewAllCubit(this._repo)
      : super(
          const GetProductsViewAllState.initial(
            hasMoreData: true,
            productsList: [],
          ),
        );
  final ProductsViewAllRepo _repo;
  int offset = 6;

  Future<void> getProductsViewAll(BuildContext context) async {
    emit(
      const GetProductsViewAllState.loading(
        hasMoreData: true,
        productsList: [],
      ),
    );
    final result = await _repo.getProductsViewAll(context, offset: 0);
    result.when(
      success: (data) {
        emit(
          GetProductsViewAllState.success(
            hasMoreData: false,
            productsList: data.products,
          ),
        );
      },
      error: (message) {
        emit(
          GetProductsViewAllState.failure(
            error: message,
            hasMoreData: true,
            productsList: state.productsList,
          ),
        );
      },
    );
  }

  Future<void> loddedMoreProductsViewAll(BuildContext context) async {
    if (!state.hasMoreData) return;
    offset += 6;
    emit(
      GetProductsViewAllState.loading(
        hasMoreData: state.hasMoreData,
        productsList: state.productsList,
      ),
    );
    final result = await _repo.getProductsViewAll(context, offset: offset);
    result.when(
      success: (data) {
        final moreProduct = [...state.productsList, ...data.products];
        emit(
          GetProductsViewAllState.success(
            hasMoreData: !(data.products.length < 6),
            productsList: moreProduct,
          ),
        );
      },
      error: (message) {
        emit(
          GetProductsViewAllState.failure(
            error: message,
            hasMoreData: state.hasMoreData,
            productsList: state.productsList,
          ),
        );
      },
    );
  }
}
