import 'package:e_commerce/domain/entities/response/wishlist/delete_wishlist_response.dart';
import 'package:e_commerce/domain/repository/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteProductsFromWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  DeleteProductsFromWishlistUseCase(this._wishlistRepository);

  Future<DeleteWishlistResponse> invoke(String productId) {
    return _wishlistRepository.deleteProductFromWishlist(productId);
  }
}
