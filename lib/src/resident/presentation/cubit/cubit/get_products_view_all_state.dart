part of 'get_products_view_all_cubit.dart';

@freezed
class GetProductsViewAllState with _$GetProductsViewAllState {
  const factory GetProductsViewAllState.initial({
    required List<AllProductsResponseProduct> productsList,
   required bool hasMoreData,
  }) = Initial;
  const factory GetProductsViewAllState.loading({
    required List<AllProductsResponseProduct> productsList,
   required bool hasMoreData,
  }) = Loading;
  const factory GetProductsViewAllState.success({
    required List<AllProductsResponseProduct> productsList,
   required bool hasMoreData,
  }) = Success;
  const factory GetProductsViewAllState.failure({
    required String error,
    required List<AllProductsResponseProduct> productsList,
    required bool hasMoreData,
  }) = Failure;
}
