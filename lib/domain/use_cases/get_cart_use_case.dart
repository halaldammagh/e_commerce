import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/get_cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase {
  final GetCartRepository _getCartRepository;

  GetCartUseCase(this._getCartRepository);

  Future<GetCartResponse> invoke() {
    return _getCartRepository.GetProductToCart();
  }
}
