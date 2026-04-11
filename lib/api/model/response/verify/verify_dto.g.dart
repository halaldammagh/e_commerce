// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyDto _$VerifyDtoFromJson(Map<String, dynamic> json) =>
    VerifyDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      iat: (json['iat'] as num?)?.toInt(),
      exp: (json['exp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VerifyDtoToJson(VerifyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'iat': instance.iat,
      'exp': instance.exp,
    };
