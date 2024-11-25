import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/resident/data/repo/home_repo.dart';

part 'get_banners_state.dart';
part 'get_banners_cubit.freezed.dart';

class GetBannersCubit extends Cubit<GetBannersState> {
  GetBannersCubit(this._repo) : super(const GetBannersState.loading());
  final HomeRepo _repo;

  Future<void> getBanners(BuildContext context) async {
    emit(const GetBannersState.loading());
    final result = await _repo.getBanners(context);
    result.when(
      success: (data) {
        if (data.bannersList.isEmpty) {
          emit(const GetBannersState.empty());
        } else {
          emit(GetBannersState.success(bannersImgList: data.bannersList));
        }
      },
      error: (message) {
        emit(GetBannersState.failure(error: message));
      },
    );
  }
}
