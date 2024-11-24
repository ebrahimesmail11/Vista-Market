import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/all_category/get_all_categories_response.dart';
import 'package:vista_market/src/common/network/models/customer/banners/banners_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/resident/data/remote/home_remote_source.dart';

class HomeRepo {
  HomeRepo(this._remoteSource);
  final HomeRemoteSource _remoteSource;
  Future<ApiResult<BannersResponse>> getBanners(BuildContext context) async {
    try {
      final response = await _remoteSource.getBanners();
      return ApiResult.success(response);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      } else {
        return const ApiResult.error('An unexpected error occurred');
      }
    }
  }
    Future<ApiResult<GetAllCategoriesResponse>> getAllCategoriesCustomer(
    BuildContext context,
  ) async {
    try {
      final response = await _remoteSource.getAllCategoriesCustomer();
      return ApiResult.success(response);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      }
      return const ApiResult.error('An unexpected error occurred');
    }
  }
}
