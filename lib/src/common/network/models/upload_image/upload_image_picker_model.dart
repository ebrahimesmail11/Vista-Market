import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_image_picker_model.g.dart';

@JsonSerializable()
class UploadImagePickerModel {
  UploadImagePickerModel({this.location});
  factory UploadImagePickerModel.fromJson(Map<String, dynamic> json) =>
      _$UploadImagePickerModelFromJson(json);
  final String? location;
}
