import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/localization/pref_keys.dart';
import 'package:vista_market/src/localization/shared_preferences.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDark = true;
  String currentLanguage = 'en';
// Change Theme Mode
  Future<void> changeTheme({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }

  // Change Language
  Future<void> savedlanguage() async {
    final result =  SharedPref().containPreference(PrefKeys.languageKey)
        ? SharedPref().getString(PrefKeys.languageKey)
        : 'en';
        currentLanguage=result??'en';
       emit(AppState.langChange(local: Locale(currentLanguage))); 
  }

  Future<void> _changeLanguage({required String lang}) async {
   await SharedPref().setString(PrefKeys.languageKey, lang);
    currentLanguage = lang;
    emit(AppState.langChange(local: Locale(currentLanguage)));
  }
  void langAraibc()=>_changeLanguage(lang: 'ar'); 
  void langEnglish()=>_changeLanguage(lang: 'en');
}
