import 'package:e_commerce/api/mapper/cart/add/add_products_mapper.dart';
import 'package:e_commerce/api/model/response/cart/add/add_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_cart.dart';

extension AddCartMapper on AddCartDto {
  AddCart toAddCart() {
    return AddCart(
      id: id,
      updatedAt: updatedAt,
      createdAt: createdAt,
      cartOwner: createdAt,
      products: products?.map((prodsDto) => prodsDto.toAddProducts()).toList(),
      totalCartPrice: totalCartPrice,
      v: v,
    );
  }
}
