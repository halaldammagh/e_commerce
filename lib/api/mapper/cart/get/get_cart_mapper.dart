import 'package:e_commerce/api/mapper/cart/get/get_products_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get/get_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart.dart';

extension GetCartMapper on GetCartDto {
  GetCart toGetCart() {
    return GetCart(
      id: id,
      updatedAt: updatedAt,
      createdAt: createdAt,
      totalCartPrice: totalCartPrice,
      products: products
          ?.map((getProductDto) => getProductDto.toGetProducts())
          .toList(),
      cartOwner: createdAt,
      V: V,
    );
  }
}
