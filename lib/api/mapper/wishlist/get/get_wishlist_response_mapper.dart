import 'package:e_commerce/api/mapper/wishlist/get/get_wishlist_mapper.dart';
import 'package:e_commerce/api/model/response/wishlist/get/get_wishlist_response_dto.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist_response.dart';

extension GetWishlistResponseMapper on GetWishlistResponseDto {
  GetWishlistResponse toGetWishlistResponse() {
    return GetWishlistResponse(
      status: status,
      data: data!.map((getWishDto) => getWishDto.toGetWishlist()).toList(),
      count: count,
    );
  }
}
