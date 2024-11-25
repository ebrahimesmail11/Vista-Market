import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/base/app_constants.dart';
part 'banners_response.g.dart';

@JsonSerializable()
class BannersResponse {
  BannersResponse(
    this.data,
  );
  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
  final BannersResponseData data;
  List<String> get bannersList {
    final banners = data.bannersProducts
        .where((e) => e.title!.contains(AppConstants.searchBannersKeyWord))
        .toList();
    if (banners.isNotEmpty) {
      return banners.first.images;
    }
    return [];
  }
}

@JsonSerializable()
class BannersResponseData {
  BannersResponseData(
    this.bannersProducts,
  );
  factory BannersResponseData.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseDataFromJson(json);
  @JsonKey(name: 'products')
  final List<BannersModel> bannersProducts;
}

@JsonSerializable()
class BannersModel {
  BannersModel(
    this.title,
    this.images,
  );
  factory BannersModel.fromJson(Map<String, dynamic> json) =>
      _$BannersModelFromJson(json);
  final String? title;
  final List<String> images;
}
