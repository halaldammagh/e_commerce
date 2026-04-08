import 'package:e_commerce/domain/entities/response/cart/add/add_cart.dart';

class AddProductCartResponse {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final AddCart? data;

  AddProductCartResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}
