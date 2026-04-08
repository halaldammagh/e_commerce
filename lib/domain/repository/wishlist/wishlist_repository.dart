import 'package:e_commerce/domain/entities/response/wishlist/add_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist_response.dart';

import '../../entities/response/wishlist/delete_wishlist_response.dart';

abstract class WishlistRepository {
  Future<AddWishlistResponse> addProductToWishlist(String productId);

  Future<GetWishlistResponse> getProductInWishlist();

  Future<DeleteWishlistResponse> deleteProductFromWishlist(String productId);
}
