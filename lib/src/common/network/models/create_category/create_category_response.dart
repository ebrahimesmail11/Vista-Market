
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_response.g.dart';

@JsonSerializable()
class CreateCategoryResponse {
  const CreateCategoryResponse(this.data);
  factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseFromJson(json);
  final CreateCategoryResponseData data;
}
@JsonSerializable()
class CreateCategoryResponseData {
  CreateCategoryResponseData(
    this.addCategory,
  );
  factory CreateCategoryResponseData.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseDataFromJson(json);
  final CreateAddCategory addCategory;
}
@JsonSerializable()
class CreateAddCategory {
  CreateAddCategory(
    this.id,
    this.name,
    this.image,
  );
  factory CreateAddCategory.fromJson(Map<String, dynamic> json) =>
      _$CreateAddCategoryFromJson(json);
  final String? id;
  final String? name;
  final String? image;
}
