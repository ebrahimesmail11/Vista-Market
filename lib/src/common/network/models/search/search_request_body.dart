import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request_body.g.dart';

@JsonSerializable()
class SearchRequestbody {
  SearchRequestbody({
    required this.title,
    required this.priceMin,
    required this.priceMax,
  });
  Map<String, dynamic> toJson() => _$SearchRequestbodyToJson(this);
  final String? title;
  final int? priceMin;
  final int? priceMax;
}
