part of 'update_category_cubit.dart';

@freezed
class UpdateCategoryState with _$UpdateCategoryState {
  const factory UpdateCategoryState.initial() = _Initial;
  const factory UpdateCategoryState.loading() = Loading;
  const factory UpdateCategoryState.success() = Success;
  const factory UpdateCategoryState.failure({required String error}) = Failure;
}
