import 'package:json_annotation/json_annotation.dart';

part 'delete_wishlist_response_dto.g.dart';

@JsonSerializable()
class DeleteWishlistResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  DeleteWishlistResponseDto({this.status, this.message, this.data});

  factory DeleteWishlistResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DeleteWishlistResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteWishlistResponseDtoToJson(this);
  }
}
