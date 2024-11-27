import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/resident/data/remote/products_view_all_remote_source.dart';

class ProductsViewAllRepo {
  ProductsViewAllRepo(this._remote);
  final ProductsViewAllRemoteSource _remote;

  Future<ApiResult<AllProductsResponse>> getProductsViewAll(
    BuildContext context, {
    required int offset,
  }) async {
    try {
      final response = await _remote.getProductsViewAll(offset: offset);
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
