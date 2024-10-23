part of 'users_number_cubit.dart';

@freezed
class UsersNumberState with _$UsersNumberState {
  const factory UsersNumberState.loading() = Loading;
  const factory UsersNumberState.success({required String numbers}) = Success;
  const factory UsersNumberState.failure({required String error}) = Failure;
}
