// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWishlistResponseDto _$GetWishlistResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetWishlistResponseDto(
  status: json['status'] as String?,
  count: (json['count'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => GetWishlistDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetWishlistResponseDtoToJson(
  GetWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'data': instance.data,
};
