// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequestbody _$SearchRequestbodyFromJson(Map<String, dynamic> json) =>
    SearchRequestbody(
      title: json['title'] as String?,
      priceMin: (json['priceMin'] as num?)?.toInt(),
      priceMax: (json['priceMax'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchRequestbodyToJson(SearchRequestbody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'priceMin': instance.priceMin,
      'priceMax': instance.priceMax,
    };
