part of 'create_add_category_cubit.dart';

@freezed
class CreateAddCategoryState with _$CreateAddCategoryState {
  const factory CreateAddCategoryState.initial() = _Initial;
  const factory CreateAddCategoryState.loading() = Loading;
  const factory CreateAddCategoryState.success() = Success;
  const factory CreateAddCategoryState.failure({required String error}) =
      Failure;
}
