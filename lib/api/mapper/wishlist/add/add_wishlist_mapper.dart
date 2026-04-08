import 'package:e_commerce/domain/entities/response/wishlist/add_wishlist_response.dart';

import '../../../model/response/wishlist/add/add_wishlist_response_dto.dart';

extension AddWishlistMapper on AddWishlistResponseDto {
  AddWishlistResponse toAddWishlistResponse() {
    return AddWishlistResponse(data: data, status: status, message: message);
  }
}
