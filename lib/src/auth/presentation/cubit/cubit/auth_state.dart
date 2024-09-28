import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success() = Success;
  const factory AuthState.failure({required String error}) = Failure;
}
