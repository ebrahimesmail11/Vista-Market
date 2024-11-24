import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/all_category/get_all_categories_response.dart';
import 'package:vista_market/src/resident/data/repo/home_repo.dart';

part 'get_categories_customer_state.dart';
part 'get_categories_customer_cubit.freezed.dart';

class GetCategoriesCustomerCubit extends Cubit<GetCategoriesCustomerState> {
  GetCategoriesCustomerCubit(this._repo)
      : super(const GetCategoriesCustomerState.loading());
  final HomeRepo _repo;

  Future<void> getAllCategoriesCustomer(BuildContext context) async {
    emit(const GetCategoriesCustomerState.loading());
    final result = await _repo.getAllCategoriesCustomer(context);
    result.when(
      success: (data) {
        if (data.categoriesList.isEmpty) {
          emit(const GetCategoriesCustomerState.empty());
        } else {
          emit(
            GetCategoriesCustomerState.success(
              categoriesList: data.categoriesList,
            ),
          );
        }
      },
      error: (message) {
        emit(GetCategoriesCustomerState.failure(error: message));
      },
    );
  }
}
