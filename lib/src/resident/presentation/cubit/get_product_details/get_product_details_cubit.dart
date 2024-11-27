import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/customer/product_details/product_details_response.dart';
import 'package:vista_market/src/resident/data/repo/product_details_repo.dart';

part 'get_product_details_state.dart';
part 'get_product_details_cubit.freezed.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetailsCubit(this._repo)
      : super(const GetProductDetailsState.loading());
  final ProductDetailsRepo _repo;

  Future<void> getProductDetails(
    BuildContext context, {
    required int id,
  }) async {
    emit(const GetProductDetailsState.loading());
    final result = await _repo.getProductsDetails(context, id: id);
    result.when(
      success: (productDetails) {
        emit(
          GetProductDetailsState.success(
            productDetailsModel: productDetails.data.product,
          ),
        );
      },
      error: (message) {
        emit(GetProductDetailsState.failure(error: message));
      },
    );
  }
}
