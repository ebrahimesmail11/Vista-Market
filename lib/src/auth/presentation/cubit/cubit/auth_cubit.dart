import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/auth/data/repo/auth_repos.dart';
import 'package:vista_market/src/auth/presentation/cubit/cubit/auth_state.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
import 'package:vista_market/src/common/base/user_type.dart';
import 'package:vista_market/src/common/network/models/login/login_request_body.dart';
import 'package:vista_market/src/common/network/models/login/login_response.dart';
import 'package:vista_market/src/common/storage/local_storage_helper.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepos)
      : super(
          const AuthState.initial(),
        );
  final AuthRepos _authRepos;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> login() async {
    emit(const AuthState.loading());
    final response = await _authRepos.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginModel) async {
       await saveUserToken(loginModel);
       await saveUserType(AppConstants.userType);
      },
      error: (error) => emit(
        AuthState.failure(
          error: error,
        ),
      ),
    );
  }

  Future<void> saveUserToken(LoginResponse loginModel) async {
    final token = loginModel.data!.login!.accessToken ?? '';
    await LocalStorageHelper.write(
      PrefKeys.tokenKey,
      token,
    );
    isLoggedInUser = true;
    await SharedPref().setString(PrefKeys.tokenKey, token);
    final user= await _authRepos.userRole(token);
    await LocalStorageHelper.write(
      PrefKeys.userId,
      user.userId?.toString()??'',
    );
  }
  Future<void> saveUserType(UserTypes userType)async{
    await LocalStorageHelper.write(
      AppConstants.user,
      userType.name,
    );
  }
}
