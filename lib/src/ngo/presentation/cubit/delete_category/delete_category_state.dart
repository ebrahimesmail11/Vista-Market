part of 'delete_category_cubit.dart';

@freezed
class DeleteCategoryState with _$DeleteCategoryState {
  const factory DeleteCategoryState.initial() = _Initial;
  const factory DeleteCategoryState.loading({required String categoryId}) = Loading;
  const factory DeleteCategoryState.success() = Success;
  const factory DeleteCategoryState.failure({required String error}) = Failure;

}
