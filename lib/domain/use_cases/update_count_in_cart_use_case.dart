import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCountInCartUseCase {
  final CartRepository _cartRepository;

  UpdateCountInCartUseCase(this._cartRepository);

  Future<GetCartResponse> invoke(String productId, int count) {
    return _cartRepository.updateCountInCart(productId, count);
  }
}
