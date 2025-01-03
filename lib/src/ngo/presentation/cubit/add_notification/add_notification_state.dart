part of 'add_notification_cubit.dart';

@freezed
class AddNotificationState with _$AddNotificationState {
  const factory AddNotificationState.initial() = _Initial;
  const factory AddNotificationState.loading() = Loading;
  const factory AddNotificationState.success() = Success;
  const factory AddNotificationState.failure({
    required String error,
  }) = Failure;
}
