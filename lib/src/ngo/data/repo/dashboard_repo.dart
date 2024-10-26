import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/categories/categories_response.dart';
import 'package:vista_market/src/common/network/models/products/products_response.dart';
import 'package:vista_market/src/common/network/models/users/users_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/ngo/data/remote/dashboard_remote_source.dart';

class DashboardRepo {
  const DashboardRepo(this._remoteSource);
  final DashboardRemoteSource _remoteSource;

  Future<ApiResult<ProductsResponse>> numberofProducts(
    BuildContext context,
  ) async {
    try {
      final response = await _remoteSource.numberOfProducts();
      return ApiResult.success(response);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      }
      return const ApiResult.error('An unexpected error occurred');
    }
  }

  Future<ApiResult<CategoriesResponse>> numberofCategories(
    BuildContext context,
  ) async {
    try {
      final response = await _remoteSource.numberOfCategories();
      return ApiResult.success(response);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      }
      return const ApiResult.error('An unexpected error occurred');
    }
  }

  Future<ApiResult<UsersResponse>> numberOfUsers(BuildContext context) async {
    try {
      final response = await _remoteSource.numberOfUsers();
      return ApiResult.success(response);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      }
      return const ApiResult.error('An unexpected error occurred');
    }
  }
}
