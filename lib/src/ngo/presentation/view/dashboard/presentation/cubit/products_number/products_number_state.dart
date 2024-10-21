part of 'products_number_cubit.dart';

@freezed
class ProductsNumberState with _$ProductsNumberState {
  const factory ProductsNumberState.initial() = _Initial;
  const factory ProductsNumberState.loading() = Loading;
  const factory ProductsNumberState.success({required String numbers}) =
      Success;
  const factory ProductsNumberState.failure({required String error}) = Failure;
}
