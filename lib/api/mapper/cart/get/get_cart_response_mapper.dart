import 'package:e_commerce/api/mapper/cart/get/get_cart_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get/get_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

extension GetCartResponseMapper on GetCartResponseDto {
  GetCartResponse toGetCartResponse() {
    return GetCartResponse(
      cartId: cartId,
      data: data!.toGetCart(),
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}
