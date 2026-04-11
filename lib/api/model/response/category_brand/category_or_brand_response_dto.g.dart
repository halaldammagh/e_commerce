// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_or_brand_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryOrBrandResponseDto _$CategoryOrBrandResponseDtoFromJson(
  Map<String, dynamic> json,
) => CategoryOrBrandResponseDto(
  results: (json['results'] as num?)?.toInt(),
  metadata: json['metadata'] == null
      ? null
      : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CategoryOrBrandDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryOrBrandResponseDtoToJson(
  CategoryOrBrandResponseDto instance,
) => <String, dynamic>{
  'results': instance.results,
  'metadata': instance.metadata,
  'data': instance.data,
};
