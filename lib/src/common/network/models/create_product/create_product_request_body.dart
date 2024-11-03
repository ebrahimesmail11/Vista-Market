
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_request_body.g.dart';

@JsonSerializable()
class CreateProductRequestBody {
  const CreateProductRequestBody({
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.categoryId,
  });
  Map<String, dynamic> toJson() => _$CreateProductRequestBodyToJson(this);
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final double categoryId;
}
