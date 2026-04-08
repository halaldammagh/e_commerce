import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

abstract class CartRepository {
  Future<AddProductCartResponse> addProductToCart(String productId);

  Future<GetCartResponse> deleteItemInCart(String productId);

  Future<GetCartResponse> updateCountInCart(String productId, int count);
}
