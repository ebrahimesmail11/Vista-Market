import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/resident/data/repo/home_repo.dart';

part 'get_products_customer_state.dart';
part 'get_products_customer_cubit.freezed.dart';

class GetProductsCustomerCubit extends Cubit<GetProductsCustomerState> {
  GetProductsCustomerCubit(this._repo)
      : super(const GetProductsCustomerState.loading());
  final HomeRepo _repo;
  bool isProductListSmallerThan14 = false;
  Future<void> getProductsCustomer(BuildContext context) async {
    emit(const GetProductsCustomerState.loading());
    final result = await _repo.getAllProductsCustomer(context);
    result.when(
      success: (data){
        if(data.products.isEmpty){
          emit(const GetProductsCustomerState.empty());
        }else {
          isProductListSmallerThan14 = data.products.length >=14;
          emit(GetProductsCustomerState.success(productsList: data.products));
        }
      },
      error: (message) {
        emit(GetProductsCustomerState.failure(error: message));
      },
    );
  }
}
