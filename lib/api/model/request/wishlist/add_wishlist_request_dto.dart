import 'package:json_annotation/json_annotation.dart';

part 'add_wishlist_request_dto.g.dart';

@JsonSerializable()
class AddWishlistRequestDto {
  @JsonKey(name: "productId")
  final String? productId;

  AddWishlistRequestDto({this.productId});

  factory AddWishlistRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddWishlistRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddWishlistRequestDtoToJson(this);
  }
}
