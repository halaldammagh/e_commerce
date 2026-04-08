import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  final CartRepository _CartRepository;

  AddToCartUseCase(this._CartRepository);

  Future<AddProductCartResponse> invoke(String productId) {
    return _CartRepository.addProductToCart(productId);
  }
}
