// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteWishlistResponseDto _$DeleteWishlistResponseDtoFromJson(
  Map<String, dynamic> json,
) => DeleteWishlistResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$DeleteWishlistResponseDtoToJson(
  DeleteWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
