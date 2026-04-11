// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResponseDto _$VerifyResponseDtoFromJson(Map<String, dynamic> json) =>
    VerifyResponseDto(
      message: json['message'] as String?,
      decoded: json['decoded'] == null
          ? null
          : VerifyDto.fromJson(json['decoded'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyResponseDtoToJson(VerifyResponseDto instance) =>
    <String, dynamic>{'message': instance.message, 'decoded': instance.decoded};
