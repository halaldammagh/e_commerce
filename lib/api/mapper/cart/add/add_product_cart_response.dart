import 'package:e_commerce/api/mapper/cart/add/add_cart_mapper.dart';
import 'package:e_commerce/api/model/response/cart/add/add_product_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';

extension AddCartResponseMapper on AddProductCartResponseDto {
  AddProductCartResponse toAddProductCartResponse() {
    return AddProductCartResponse(
      status: status,
      numOfCartItems: numOfCartItems,
      data: data?.toAddCart(),
      cartId: cartId,
      message: message,
    );
  }
}
