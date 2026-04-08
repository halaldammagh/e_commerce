import 'package:e_commerce/api/model/response/cart/add/add_products_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_products.dart';

extension AddProductsMapper on AddProductsDto {
  AddProducts toAddProducts() {
    return AddProducts(id: id, price: price, count: count, product: product);
  }
}
