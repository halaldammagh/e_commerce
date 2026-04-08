import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist_response.dart';
import 'package:e_commerce/domain/repository/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsInWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  GetProductsInWishlistUseCase(this._wishlistRepository);

  Future<GetWishlistResponse> invoke() {
    return _wishlistRepository.getProductInWishlist();
  }
}
