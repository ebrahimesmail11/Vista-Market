part of 'get_category_cubit.dart';

@freezed
class GetCategoryState with _$GetCategoryState {
  const factory GetCategoryState.loading() = Loading;
  const factory GetCategoryState.success({
    required List<AllProductsResponseProduct> productsList,
  }) = Success;
  const factory GetCategoryState.empty() = Empty;
  const factory GetCategoryState.failure({
    required String error,
  }) = Failure;
}
