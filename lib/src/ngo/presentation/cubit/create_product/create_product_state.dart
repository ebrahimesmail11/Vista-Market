part of 'create_product_cubit.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _Initial;
  const factory CreateProductState.loading() = Loading;
  const factory CreateProductState.success() = Success;
  const factory CreateProductState.failure({required String error}) = Failure;
}
