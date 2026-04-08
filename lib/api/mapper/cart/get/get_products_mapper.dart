import 'package:e_commerce/api/mapper/product/product_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get/get_products_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_products.dart';

extension GetProductsMapper on GetProductsDto {
  GetProducts toGetProducts() {
    return GetProducts(
      id: id,
      product: product!.toProduct(),
      count: count,
      price: price,
    );
  }
}
