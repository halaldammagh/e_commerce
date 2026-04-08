import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

abstract class GetCartRepository {
  Future<GetCartResponse> GetProductToCart();
}
