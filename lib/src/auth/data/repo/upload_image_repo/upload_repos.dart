import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vista_market/src/auth/data/remote/upload_image_remote/upload_remote_source.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/network/models/upload_image/upload_image_picker_model.dart';
import 'package:vista_market/src/common/network/service/graphql/api_result.dart';

class UploadRepos {
  const UploadRepos(this._uploadRemoteSource);

  final UploadRemoteSource _uploadRemoteSource;
  Future<ApiResult<UploadImagePickerModel>> uploadImage(
    BuildContext context,
    XFile imageFile,
  ) async {
    try {
      final response = await _uploadRemoteSource.uploadImage(file: imageFile);
      return ApiResult.success(response);
    } catch (e) {
      // return ApiResult.error(context.tr.error_msg);
      if (context.mounted) {
        return ApiResult.error(context.tr.error_msg);
      }
      return const ApiResult.error('An unexpected error occurred.');
    }
  }
}
