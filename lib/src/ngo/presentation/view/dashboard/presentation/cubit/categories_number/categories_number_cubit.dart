import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/data/repo/dashboard_repo.dart';

part 'categories_number_state.dart';
part 'categories_number_cubit.freezed.dart';

class CategoriesNumberCubit extends Cubit<CategoriesNumberState> {
  CategoriesNumberCubit(this._dashboardRepo)
      : super(const CategoriesNumberState.initial());
  final DashboardRepo _dashboardRepo;

  Future<void> getNumberOfCategories(BuildContext context) async {
    emit(const CategoriesNumberState.loading());
    final result = await _dashboardRepo.numberofCategories(context);
    result.when(
      success: (categoriesNumebr) {
        emit(
          CategoriesNumberState.success(
          numbers: categoriesNumebr.categoriesNameNumber,
        ),);
      },
      error: (error) {
        emit(
          CategoriesNumberState.failure(
            error: error,
          ),
        );
      },
    );
  }
}
