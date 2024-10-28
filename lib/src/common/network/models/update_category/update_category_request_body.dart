import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_category_request_body.g.dart';

@JsonSerializable()
class UpdateCategoryRequestBody {
  const UpdateCategoryRequestBody({
    required this.id,
    required this.name,
    required this.image,
  });
  final String id;
  final String name;
  final String image;

  Map<String, dynamic> toJson() => _$UpdateCategoryRequestBodyToJson(this);
}
