import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/auth/data/repo/auth_repo/auth_repos.dart';
import 'package:vista_market/src/auth/presentation/cubit/login/auth_state.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/base/extensions.dart';

import 'package:vista_market/src/common/network/models/login/login_request_body.dart';
import 'package:vista_market/src/common/network/models/login/login_response.dart';
import 'package:vista_market/src/common/network/models/registration/registration_request_body.dart';
import 'package:vista_market/src/common/storage/local_storage_helper.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._authRepos,
  ) : super(const AuthState.initial());

  final AuthRepos _authRepos;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void clearFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(const AuthState.loading());

    try {
      final response = await _authRepos.login(
        LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );

      await response.when(
        success: (loginModel) async {
          await saveUserToken(loginModel, context);
        },
        error: (error) {
          if (context.mounted) {
            emit(AuthState.failure(error: context.tr.error_msg));
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        emit(AuthState.failure(error: context.tr.occurred_error));
      }
    }
  }

  Future<void> saveUserToken(
    LoginResponse loginModel,
    BuildContext context,
  ) async {
    final token = loginModel.data?.login?.accessToken ?? '';
    if (token.isEmpty) {
      emit(const AuthState.failure(error: 'Token cannot be empty'));
      return;
    }
    final userResult = await _authRepos.userRole(token);
    await userResult.when(
      success: (user) async {
        final userRole = user.userRole ?? '';
        if (userRole.isEmpty) {
          emit(
            AuthState.failure(error: context.tr.failure_role),
          );
          return;
        }
        final userId = user.userId?.toString() ?? '';
        await SharedPref().setInt(PrefKeys.userId, user.userId??0);
        await LocalStorageHelper.write(PrefKeys.userId, userId);
        await LocalStorageHelper.write(PrefKeys.userRole, userRole);
        await LocalStorageHelper.write(PrefKeys.tokenKey, token);
        isLoggedInUser = true;
        await SharedPref()
            .setBoolean(AppConstants.userAlreadyLoggedInKey, true);
        await _authRepos.addUserIdNotification(
          userId: userId,
        );
        emit(AuthState.success(userRole: userRole));
      },
      error: (error) async {
        emit(
          AuthState.failure(
            error: context.tr.failure_login,
          ),
        );
      },
    );
  }

  Future<void> register(
    BuildContext context, {
    required String imageUrl,
  }) async {
    emit(const AuthState.loading());

    final result = await _authRepos.registration(
      RegistrationRequestBody(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        avatar: imageUrl,
      ),
      context,
    );
    if (imageUrl.isEmpty) {
      emit(const AuthState.failure(error: 'Image URL cannot be empty'));
      return;
    }
    result.when(
      success: (signUpData) {
        login(context);
      },
      error: (error) {
        emit(
          AuthState.failure(
            error: error,
          ),
        );
      },
    );
  }
}
