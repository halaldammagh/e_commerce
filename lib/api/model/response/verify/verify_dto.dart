import 'package:json_annotation/json_annotation.dart';

part 'verify_dto.g.dart';

@JsonSerializable()
class VerifyDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "iat")
  final int? iat;
  @JsonKey(name: "exp")
  final int? exp;

  VerifyDto({this.id, this.name, this.role, this.iat, this.exp});

  factory VerifyDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyDtoToJson(this);
  }
}
