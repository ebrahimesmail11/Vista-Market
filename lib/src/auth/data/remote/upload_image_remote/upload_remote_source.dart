import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vista_market/src/common/network/models/upload_image/upload_image_picker_model.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';

class UploadRemoteSource {
  const UploadRemoteSource(this._apiService);

  final ApiService _apiService;

  Future<UploadImagePickerModel> uploadImage({required XFile file}) async {
    final formData =FormData();
    formData.files.add(
      MapEntry(
        'file',
     await  MultipartFile.fromFile(file.path,),
      ),
    );
    final response = await _apiService.uploadImage(formData);
    return response;
  }
}
