import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/resident/data/remote/category_remote_source.dart';

class CategoryRepo {
  CategoryRepo(this._remoteSource);
  final CategoryRemoteSource _remoteSource;

  Future<ApiResult<AllProductsResponse>> getCategory(
    BuildContext context, {
    required int categoryId,
  }) async {
    try {
      final response = await _remoteSource.getCategory(categoryId: categoryId);
      return ApiResult.success(response);
    } catch (e) {
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      } else {
        return const ApiResult.error('An unexpected error occurred');
      }
    }
  }
}
