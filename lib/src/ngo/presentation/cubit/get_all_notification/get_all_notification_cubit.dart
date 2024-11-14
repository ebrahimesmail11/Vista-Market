import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/hive/hive_database.dart';
import 'package:vista_market/src/common/network/models/add_notification/add_notification_model.dart';

part 'get_all_notification_state.dart';
part 'get_all_notification_cubit.freezed.dart';

class GetAllNotificationCubit extends Cubit<GetAllNotificationState> {
  GetAllNotificationCubit() : super(const GetAllNotificationState.loading());

  Future<void> getAllNotification() async {
    try {
      emit(const GetAllNotificationState.loading());
      final result = HiveDatabase().notificationBox!.values.toList();
      if (result.isEmpty) {
        emit(const GetAllNotificationState.empty());
      } else {
        emit(GetAllNotificationState.success(notifications: result));
      }
    } catch (e) {
      emit(GetAllNotificationState.failure(error: e.toString()));
    }
  }
}
