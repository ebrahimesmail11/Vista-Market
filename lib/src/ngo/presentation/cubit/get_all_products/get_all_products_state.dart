part of 'get_all_products_cubit.dart';

@freezed
class GetAllProductsState with _$GetAllProductsState {
  const factory GetAllProductsState.loading() = Loading;
  const factory GetAllProductsState.success({
    required List<AllProductsResponseProduct> productsList,
  }) = Success;
  const factory GetAllProductsState.empty() = Empty;
  const factory GetAllProductsState.failure({required String error}) = Failure;
}
