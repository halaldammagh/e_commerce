import 'package:e_commerce/api/model/response/verify/verify_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_response_dto.g.dart';

@JsonSerializable()
class VerifyResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "decoded")
  final VerifyDto? decoded;

  VerifyResponseDto({this.message, this.decoded});

  factory VerifyResponseDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResponseDtoToJson(this);
  }
}
