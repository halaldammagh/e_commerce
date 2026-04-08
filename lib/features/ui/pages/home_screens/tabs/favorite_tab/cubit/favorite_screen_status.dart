import 'package:e_commerce/domain/entities/response/wishlist/add_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/delete_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist_response.dart';

sealed class FavoriteScreenStatus {}

class AddProductToFavoriteInitialState extends FavoriteScreenStatus {}

class AddProductToCartLoadingState extends FavoriteScreenStatus {}

class AddProductToFavoriteErrorState extends FavoriteScreenStatus {
  String errorMessage;

  AddProductToFavoriteErrorState({required this.errorMessage});
}

class AddProductToFavoriteSuccessState extends FavoriteScreenStatus {
  AddWishlistResponse wishlistResponse;

  AddProductToFavoriteSuccessState({required this.wishlistResponse});
}

class GetProductInWishlistLoadingState extends FavoriteScreenStatus {}

class GetProductInWishlistErrorState extends FavoriteScreenStatus {
  String errorMessage;

  GetProductInWishlistErrorState({required this.errorMessage});
}

class GetProductInWishlistSuccessState extends FavoriteScreenStatus {
  GetWishlistResponse getWishlistResponse;

  GetProductInWishlistSuccessState({required this.getWishlistResponse});
}

class DeleteProductFromWishlistLoadingState extends FavoriteScreenStatus {}

class DeleteProductFromWishlistErrorState extends FavoriteScreenStatus {
  String errorMessage;

  DeleteProductFromWishlistErrorState({required this.errorMessage});
}

class DeleteProductFromWishlistSuccessState extends FavoriteScreenStatus {
  DeleteWishlistResponse deleteWishlistResponse;

  DeleteProductFromWishlistSuccessState({required this.deleteWishlistResponse});
}
