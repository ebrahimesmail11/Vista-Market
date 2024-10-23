import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  CategoriesResponse(this.data);
  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
  final CategoriesResponseData data;
  String get categoriesNameNumber{
    if(data.categoriesList.isEmpty) return '0';
    return data.categoriesList.length.toString();
  }
}

@JsonSerializable()
class CategoriesResponseData {
  CategoriesResponseData(this.categoriesList);
  factory CategoriesResponseData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseDataFromJson(json);
  @JsonKey(name: 'categories')
  final List<CategoriesModel> categoriesList;
}

@JsonSerializable()
class CategoriesModel {
  CategoriesModel(this.name);
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
  final String? name;
}
