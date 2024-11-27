part of 'get_product_details_cubit.dart';

@freezed
class GetProductDetailsState with _$GetProductDetailsState {
  const factory GetProductDetailsState.loading() = Loading;
  const factory GetProductDetailsState.success({
    required ProductDetailsResponseProduct productDetailsModel,
  }) = Success;
  const factory GetProductDetailsState.failure({required String error}) =
      Failure;
}
