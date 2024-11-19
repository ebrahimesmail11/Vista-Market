part of 'profile_user_cubit.dart';

@freezed
class ProfileUserState with _$ProfileUserState {
  const factory ProfileUserState.loading() = Loading;
  const factory ProfileUserState.success({
    required UserRoleModel userModel,
  }) = Success;
  const factory ProfileUserState.failure({required String error}) = Failure;
}
