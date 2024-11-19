
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/resident/data/repo/profile_repo.dart';

part 'profile_user_state.dart';
part 'profile_user_cubit.freezed.dart';

class ProfileUserCubit extends Cubit<ProfileUserState> {
  ProfileUserCubit(this._repo) : super(const ProfileUserState.loading());
  final ProfileRepo _repo;

  Future<void> profileUser(BuildContext context) async {
    emit(const ProfileUserState.loading());
    final result =await _repo.profileUser(context);
    result.when(
      success: (data) {
        emit(ProfileUserState.success(userModel: data));
      },
      error: (message) {
        emit(ProfileUserState.failure(error: message));
      },
    );
  }
}
