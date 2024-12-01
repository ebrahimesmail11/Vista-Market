import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/common/network/models/search/search_request_body.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';
import 'package:vista_market/src/resident/data/remote/search_remote_source.dart';

class SearchRepo {
  SearchRepo(this._remoteSource);
  final SearchRemoteSource _remoteSource;

  Future<ApiResult<AllProductsResponse>> getSearchRepo(
    BuildContext context, {
    required SearchRequestbody body,
  }) async {
    try {
      final response = await _remoteSource.getSearchRemoteSource(body: body);
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
