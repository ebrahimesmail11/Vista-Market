import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/ngo/data/repo/notification_repo.dart';

part 'send_notification_state.dart';
part 'send_notification_cubit.freezed.dart';

class SendNotificationCubit extends Cubit<SendNotificationState> {
  SendNotificationCubit(this._repo)
      : super(const SendNotificationState.initial());
  final NotificationRepo _repo;

  Future<void> sendNotification(
    BuildContext context, {
    required String title,
    required String body,
    required int productId,
    required int indexId,
  }) async {
    emit(
      SendNotificationState.loading(
        indexId: indexId,
      ),
    );
    final result = await _repo.sendNotificationsRemote(
      context,
      title: title,
      body: body,
      productId: productId,
    );
    await result.when(
      success: (_) async {
        await _repo.addNotificationToAllUsersFirebase(
          body: body,
          title: title,
          productId: productId,
        );
        emit(const SendNotificationState.success());
      },
      error: (error) {
        emit(SendNotificationState.failure(error: error));
      },
    );
  }
}
