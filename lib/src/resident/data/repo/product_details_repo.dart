import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/customer/product_details/product_details_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/resident/data/remote/product_details_remote_source.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this._remoteSource);
  final ProductDetailsRemoteSource _remoteSource;
  Future<ApiResult<ProductDetailsResponse>> getProductsDetails(
    BuildContext context, {
    required int id,
  }) async {
    try {
      final response = await _remoteSource.getProductsDetails(id: id);
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
