part of 'get_products_customer_cubit.dart';

@freezed
class GetProductsCustomerState with _$GetProductsCustomerState {
  const factory GetProductsCustomerState.loading() = Loading;
  const factory GetProductsCustomerState.success({
    required List<AllProductsResponseProduct> productsList,
  }) = Success;
  const factory GetProductsCustomerState.empty() = Empty;
  const factory GetProductsCustomerState.failure({required String error}) =
      Failure;
}
