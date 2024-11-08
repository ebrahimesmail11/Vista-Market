part of 'get_all_users_cubit.dart';

@freezed
class GetAllUsersState with _$GetAllUsersState {
  const factory GetAllUsersState.loading() = Loading;
  const factory GetAllUsersState.success({
    required List<AllUsersResponseDataUsers> usersList,
  }) = Success;
  const factory GetAllUsersState.empty() = Empty;
  const factory GetAllUsersState.failure({required String error}) = Failure;
  const factory GetAllUsersState.search({
    required List<AllUsersResponseDataUsers> usersList,
  }) = SearchUser;
}
