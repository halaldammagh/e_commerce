// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWishlistResponseDto _$AddWishlistResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddWishlistResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$AddWishlistResponseDtoToJson(
  AddWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
