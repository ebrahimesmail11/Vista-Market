part of 'send_notification_cubit.dart';

@freezed
class SendNotificationState with _$SendNotificationState {
  const factory SendNotificationState.initial() = _Initial;
  const factory SendNotificationState.loading({required int indexId}) = Loading;
  const factory SendNotificationState.success() = Success;
  const factory SendNotificationState.failure({required String error}) = Failure;
}
