import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/auth/data/repo/upload_image_repo/upload_repos.dart';
import 'package:vista_market/src/utils/image_picker.dart';
part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repos) : super(const UploadImageState.initial());
  final UploadRepos _repos;
  String getimageUrl = '';
   List<String> images = ['', '', ''];
   List<String> updateProductImage = [];
  Future<void> uploadImage(BuildContext context) async {
    final pickedImage = await PickImage().pickImage();
    if (pickedImage == null) return;
    emit(const UploadImageState.loading());
    final result = await _repos.uploadImage(context, pickedImage);
    result.when(
      success: (image) {
        getimageUrl = image.location ?? '';
        emit(const UploadImageState.success());
      },
      error: (error) {
        emit(UploadImageState.failure(error));
      },
    );
  }

  Future<void> uploadImageList(
    BuildContext context, {
    required int indexList,
  }) async {
    final pickedImage = await PickImage().pickImage();
    if (pickedImage == null) return;
    emit(UploadImageState.loadingList(indexList));
    final result = await _repos.uploadImage(context, pickedImage);
    result.when(
      success: (image) {
        images
          ..removeAt(indexList)
          ..insert(indexList, image.location ?? '');
        emit(const UploadImageState.success());
      },
      error: (error) {
        emit(UploadImageState.failure(error));
      },
    );
  }

  Future<void> updateImage(
    BuildContext context, {
    required int indexList,
    required List<String> productImageList,
  }) async {
    final pickedImage = await PickImage().pickImage();
    if (pickedImage == null) return;
    emit(UploadImageState.loadingList(indexList));
    final result = await _repos.uploadImage(context, pickedImage);
    result.when(
  success: (image) {
    log('Old product image list: $productImageList');
    if (image.location != null && image.location!.isNotEmpty) {
      updateProductImage = productImageList;
      updateProductImage
        ..removeAt(indexList)
        ..insert(indexList, image.location!);
      log('Updated product image list: $updateProductImage');
      emit(const UploadImageState.success());
    } else {
      emit(const UploadImageState.failure('Invalid image location.'));
    }
  },
  error: (error) {
    emit(UploadImageState.failure(error));
  },
);
  }

  void removeImage() {
    getimageUrl = '';
    emit(UploadImageState.removeImage(imageUrl: getimageUrl));
  }
}
