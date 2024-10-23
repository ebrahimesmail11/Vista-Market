import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/data/repo/dashboard_repo.dart';

part 'users_number_state.dart';
part 'users_number_cubit.freezed.dart';

class UsersNumberCubit extends Cubit<UsersNumberState> {
  UsersNumberCubit(this._dashboardRepo)
      : super(const UsersNumberState.loading());
  final DashboardRepo _dashboardRepo;

  Future<void> getNumberOfUsers(BuildContext context) async {
    emit(const UsersNumberState.loading());
    final result = await _dashboardRepo.numberOfUsers(context);
    result.when(
      success: (usersNumber) {
        emit(
          UsersNumberState.success(
            numbers: usersNumber.usersNameNumber,
          ),
        );
      },
      error: (error) {
        emit(
          UsersNumberState.failure(
            error: error,
          ),
        );
      },
    );
  }
}
