part of 'share_cubit_cubit.dart';

@freezed
class ShareCubitState with _$ShareCubitState {
  const factory ShareCubitState.initial() = _Initial;
  const factory ShareCubitState.loading({required int productId}) = Loading;
  const factory ShareCubitState.success() = Success;
}
