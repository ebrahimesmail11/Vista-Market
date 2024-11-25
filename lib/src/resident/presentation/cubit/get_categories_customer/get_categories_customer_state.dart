part of 'get_categories_customer_cubit.dart';

@freezed
class GetCategoriesCustomerState with _$GetCategoriesCustomerState {
  const factory GetCategoriesCustomerState.loading() = Loading;

  const factory GetCategoriesCustomerState.success({
    required List<GetAllCategoriesResponseCategories> categoriesList,
  }) = Success;
  const factory GetCategoriesCustomerState.empty() = Empty;

  const factory GetCategoriesCustomerState.failure({
    required String error,
  }) = Failure;
}
