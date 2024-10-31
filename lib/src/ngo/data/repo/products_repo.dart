import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/ngo/data/remote/products_remote_source.dart';

class ProductsRepo {
  ProductsRepo(this._remoteSource);
  final ProductsRemoteSource _remoteSource;
  Future<ApiResult<AllProductsResponse>> getAllProducts(
    BuildContext context,
  ) async {
    try {
      final response = await _remoteSource.getAllProducts();
      log('response::::::::::::::::::::::::::::::::: $response');
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
