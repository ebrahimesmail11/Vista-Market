import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_categories_response.g.dart';

@JsonSerializable()
class GetAllCategoriesResponse {
  GetAllCategoriesResponse(
    this.data,
  );

  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseFromJson(json);
  final GetAllCategoriesResponseData data;
  List<GetAllCategoriesResponseCategories> get categoriesList {
    if (data.categoriesList.isEmpty) {
      return [];
    }
    return data.categoriesList;
  }
}

@JsonSerializable()
class GetAllCategoriesResponseData {
  GetAllCategoriesResponseData(
    this.categoriesList,
  );
  factory GetAllCategoriesResponseData.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseDataFromJson(json);
  @JsonKey(name: 'categories')
  final List<GetAllCategoriesResponseCategories> categoriesList;
}

@JsonSerializable()
class GetAllCategoriesResponseCategories {
  GetAllCategoriesResponseCategories(
    this.id,
    this.name,
    this.image,
  );
  factory GetAllCategoriesResponseCategories.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseCategoriesFromJson(json);
  final String? id;
  final String? name;
  final String? image;
}
