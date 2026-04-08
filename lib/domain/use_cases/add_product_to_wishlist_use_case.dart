import 'package:e_commerce/domain/entities/response/wishlist/add_wishlist_response.dart';
import 'package:e_commerce/domain/repository/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable // ✅ هذا أهم سطر
class AddProductToWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  AddProductToWishlistUseCase(this._wishlistRepository);

  Future<AddWishlistResponse> invoke(String productId) {
    return _wishlistRepository.addProductToWishlist(productId);
  }
}
