part of 'get_search_products_cubit.dart';

@freezed
class GetSearchProductsState with _$GetSearchProductsState {
  const factory GetSearchProductsState.initial() = Initial;
  const factory GetSearchProductsState.loading() = Loading;
  const factory GetSearchProductsState.success({
    required List<AllProductsResponseProduct> productsList,
  }) = Success;
  const factory GetSearchProductsState.empty() = Empty;
  const factory GetSearchProductsState.failure({required String error}) =
      Failure;
}
