part of 'get_all_notification_cubit.dart';

@freezed
class GetAllNotificationState with _$GetAllNotificationState {

  const factory GetAllNotificationState.loading() = Loading;
  const factory GetAllNotificationState.success({
    required List<AddNotificationModel> notifications,
  }) = Success;
  const factory GetAllNotificationState.empty() = Empty;
  const factory GetAllNotificationState.failure({
    required String error,
  }) = Failure;
}
