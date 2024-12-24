import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/hive/hive_database.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';

part 'add_notification_state.dart';
part 'add_notification_cubit.freezed.dart';

class AddNotificationCubit extends Cubit<AddNotificationState> {
  AddNotificationCubit() : super(const AddNotificationState.initial());
  
  Future<void> addNotification({
    required AddNotificationModel notificationModel,
  }) async {
    emit(const AddNotificationState.loading());
    try {
       await HiveDatabase().notificationBox!.add(notificationModel);
      emit(const AddNotificationState.success());
    } catch (e) {
      emit(AddNotificationState.failure(error: e.toString()));
    }
  }

  Future<void> deleteNotification({
    required AddNotificationModel notificationModel,
  }) async {
    emit(const AddNotificationState.loading());
    try {
      await notificationModel.delete();
      emit(const AddNotificationState.success());
    } catch (e) {
      emit(AddNotificationState.failure(error: e.toString()));
    }
  }
}
