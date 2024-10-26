import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_request.g.dart';
@JsonSerializable()
class CreateCategoryRequest {
  CreateCategoryRequest({required this.name, required this.image});
  Map<String, dynamic> toJson(Map<String, dynamic> json) =>
      _$CreateCategoryRequestToJson(this);
  final String name;
  final String image;
}
