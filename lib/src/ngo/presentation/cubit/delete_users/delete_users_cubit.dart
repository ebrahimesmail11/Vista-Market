
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/ngo/data/repo/users_repo.dart';

part 'delete_users_state.dart';
part 'delete_users_cubit.freezed.dart';

class DeleteUsersCubit extends Cubit<DeleteUsersState> {
  DeleteUsersCubit(this._repo) : super(const DeleteUsersState.initial());
  final UsersRepo _repo;

  Future<void> deleteUser(
    BuildContext context, {
    required String userId,
  }) async {
    emit(DeleteUsersState.loading(userId: userId));
    final result = await _repo.deleteUser(context, userId: userId);
    result.when(
      success: (userId) {
        emit(const DeleteUsersState.success());
      },
      error: (error) {
        emit(DeleteUsersState.failure(error: error));
      },
    );
  }
}
