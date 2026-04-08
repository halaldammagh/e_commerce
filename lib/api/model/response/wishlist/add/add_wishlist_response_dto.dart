import 'package:json_annotation/json_annotation.dart';

part 'add_wishlist_response_dto.g.dart';

@JsonSerializable()
class AddWishlistResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  AddWishlistResponseDto({this.status, this.message, this.data});

  factory AddWishlistResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddWishlistResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddWishlistResponseDtoToJson(this);
  }
}
