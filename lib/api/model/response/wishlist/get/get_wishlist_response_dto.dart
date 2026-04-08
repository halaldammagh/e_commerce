import 'package:e_commerce/api/model/response/wishlist/get/get_wishlist_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_wishlist_response_dto.g.dart';

@JsonSerializable()
class GetWishlistResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "data")
  final List<GetWishlistDto>? data;

  GetWishlistResponseDto({this.status, this.count, this.data});

  factory GetWishlistResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetWishlistResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetWishlistResponseDtoToJson(this);
  }
}
