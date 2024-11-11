import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/all_users/all_users_response.dart';
import 'package:vista_market/src/ngo/data/repo/users_repo.dart';

part 'get_all_users_state.dart';
part 'get_all_users_cubit.freezed.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit(this._repo) : super(const GetAllUsersState.loading());
  final UsersRepo _repo;
  List<AllUsersResponseDataUsers> usersList = [];
    final TextEditingController searchController = TextEditingController();

  Future<void> getAllUsers(
    BuildContext context, {
    required bool isNotLoading,
  }) async {
    if (isNotLoading) {
      emit(const GetAllUsersState.loading());
    }
    final result = await _repo.getAllUsers(context);
    result.when(
      success: (users) {
        if (users.data.users.isEmpty) {
          emit(const GetAllUsersState.empty());
        } else {
          emit(GetAllUsersState.success(usersList: users.data.users));
        }
      },
      error: (error) => emit(GetAllUsersState.failure(error: error)),
    );
  }
Future<void> searchUsers(BuildContext context, String? searchName) async {
  if (searchName == null || searchName.trim().isEmpty) {
    emit(const GetAllUsersState.empty());
    return;
  }

  final searchTerm = searchName.toLowerCase().trim();
  final searchList = usersList.where(
    (e) => e.name!.toLowerCase().startsWith(searchTerm) ||
            e.email!.toLowerCase().startsWith(searchTerm),
  ).toList();

  if (searchList.isEmpty) {
    emit(const GetAllUsersState.empty());
  } else {
    emit(GetAllUsersState.success(usersList: searchList));
  }
}
}
