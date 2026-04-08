import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemInCartUseCase {
  final CartRepository _cartRepository;

  DeleteItemInCartUseCase(this._cartRepository);

  Future<GetCartResponse> invoke(String productId) {
    return _cartRepository.deleteItemInCart(productId);
  }
}
