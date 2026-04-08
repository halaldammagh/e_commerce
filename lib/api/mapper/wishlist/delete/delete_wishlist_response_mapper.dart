import '../../../../domain/entities/response/wishlist/delete_wishlist_response.dart';
import '../../../model/response/wishlist/delete/delete_wishlist_response_dto.dart';

extension DeleteWishlistResponseMapper on DeleteWishlistResponseDto {
  DeleteWishlistResponse toDeleteWishlistResponse() {
    return DeleteWishlistResponse(data: data, status: status, message: message);
  }
}
