part of 'get_all_categories_cubit.dart';

@freezed
class GetAllCategoriesState with _$GetAllCategoriesState {
  const factory GetAllCategoriesState.loading() = Loading;
  const factory GetAllCategoriesState.success(
      {required GetAllCategoriesResponse categoriesList,}) = Success;
  const factory GetAllCategoriesState.empty() = Empty;
  const factory GetAllCategoriesState.failure({required String error}) =
      Failure;
}
