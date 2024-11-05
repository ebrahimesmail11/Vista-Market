part of 'delete_product_cubit.dart';

@freezed
class DeleteProductState with _$DeleteProductState {
  const factory DeleteProductState.initial() = _Initial;
  const factory DeleteProductState.loading({
    required String productId,
  }) = Loading;
  const factory DeleteProductState.success() = Success;
  const factory DeleteProductState.failure({
    required String error,
  }) = Failure;
}
