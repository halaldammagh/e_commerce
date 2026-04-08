import 'package:e_commerce/data/data_sources/remote/wishlist/wishlist_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/wishlist/add_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/delete_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist_response.dart';
import 'package:e_commerce/domain/repository/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRemoteDataSource _wishlistRemoteDataSource;

  WishlistRepositoryImpl(this._wishlistRemoteDataSource);

  @override
  Future<AddWishlistResponse> addProductToWishlist(String productId) {
    // TODO: implement addProductToWishlist
    return _wishlistRemoteDataSource.addProductToWishlist(productId);
  }

  @override
  Future<GetWishlistResponse> getProductInWishlist() {
    // TODO: implement getProductInWishlist
    return _wishlistRemoteDataSource.getProductInWishlist();
  }

  @override
  Future<DeleteWishlistResponse> deleteProductFromWishlist(String productId) {
    // TODO: implement deleteProductFromWishlist
    return _wishlistRemoteDataSource.deleteProductFromWishlist(productId);
  }
}
