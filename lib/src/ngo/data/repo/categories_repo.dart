import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/all_category/get_all_categories_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/ngo/data/remote/categories_remote_source.dart';

class CategoriesRepo {
  CategoriesRepo(this._remoteSource);
  final CategoriesRemoteSource _remoteSource;

  Future<ApiResult<GetAllCategoriesResponse>> getAllCategories(
    BuildContext context,
  ) async {
    try {
      final response = await _remoteSource.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      }
      return const ApiResult.error('An unexpected error occurred');
    }
  }
}
