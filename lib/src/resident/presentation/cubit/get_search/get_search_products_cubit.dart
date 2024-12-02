import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/models/search/search_request_body.dart';
import 'package:vista_market/src/resident/data/repo/search_repo.dart';

part 'get_search_products_state.dart';
part 'get_search_products_cubit.freezed.dart';

class GetSearchProductsCubit extends Cubit<GetSearchProductsState> {
  GetSearchProductsCubit(this._repo)
      : super(
          const GetSearchProductsState.initial(),
        );
  final SearchRepo _repo;
  Future<void> getSearchProducts(
    BuildContext context, {
    required SearchRequestbody body,
  }) async {
    emit(const GetSearchProductsState.loading());
    final result = await _repo.getSearchRepo(context, body: body);
    result.when(
      success: (data) {
        if (data.products.isEmpty) {
          emit(const GetSearchProductsState.empty());
        } else {
          emit(GetSearchProductsState.success(productsList: data.products));
        }
      },
      error: (message){
        emit(GetSearchProductsState.failure(error: message));
      },
    );
  }
}
