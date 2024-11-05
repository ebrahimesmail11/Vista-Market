import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_product_request_body.g.dart';

@JsonSerializable()
class UpdateProductRequestBody {
  const UpdateProductRequestBody(
      {required this.title,
      required this.description,
      required this.price,
      required this.images,
      required this.categoryId,
      required this.productId,});
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final double categoryId;
  final String productId;
  Map<String, dynamic> toJson() => _$UpdateProductRequestBodyToJson(this);
}
