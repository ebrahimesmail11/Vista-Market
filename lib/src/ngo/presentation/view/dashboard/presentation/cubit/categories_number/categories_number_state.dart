part of 'categories_number_cubit.dart';

@freezed
class CategoriesNumberState with _$CategoriesNumberState {
  const factory CategoriesNumberState.initial() = _Initial;
  const factory CategoriesNumberState.loading() = Loading;
  const factory CategoriesNumberState.success({required String numbers}) =
      Success;
  const factory CategoriesNumberState.failure({required String error}) =
      Failure;
}
