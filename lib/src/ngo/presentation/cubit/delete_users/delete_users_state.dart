part of 'delete_users_cubit.dart';

@freezed
class DeleteUsersState with _$DeleteUsersState {
  const factory DeleteUsersState.initial() = _Initial;
  const factory DeleteUsersState.loading({required String userId}) = Loading;
  const factory DeleteUsersState.success() = Success;
  const factory DeleteUsersState.failure({required String error}) = Failure;

}
