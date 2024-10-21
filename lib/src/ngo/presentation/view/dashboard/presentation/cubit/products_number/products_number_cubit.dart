import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/data/repo/dashboard_repo.dart';

part 'products_number_state.dart';
part 'products_number_cubit.freezed.dart';

class ProductsNumberCubit extends Cubit<ProductsNumberState> {
  ProductsNumberCubit(this._dashboardRepo)
      : super(const ProductsNumberState.initial());
 final  DashboardRepo _dashboardRepo;

  Future<void> getNumberOfProducts(BuildContext context) async {
    emit(const ProductsNumberState.loading());
    final result = await _dashboardRepo.numberofProducts(context);
    result.when(
      success: (productNumber) {
        emit(
          ProductsNumberState.success(
            numbers: productNumber.productsTitleNumber,
          ),
        );
      },
      error: (error) {
        emit(
          ProductsNumberState.failure(
            error: error,
          ),
        );
      },
    );
  }
}
