part of 'get_banners_cubit.dart';

@freezed
class GetBannersState with _$GetBannersState {
  const factory GetBannersState.loading() = Loading;
  const factory GetBannersState.success({
    required List<String> bannersImgList,
  }) = Success;
  const factory GetBannersState.empty() = Empty;
  const factory GetBannersState.failure({required String error}) = Failure;
}
