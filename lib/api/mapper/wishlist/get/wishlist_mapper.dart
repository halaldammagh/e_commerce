import 'package:e_commerce/domain/entities/response/cart/get/get_products.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist.dart';

extension WishlistMapper on GetWishlist {
  GetProducts toGetProducts() {
    return GetProducts(id: id, price: price, product: Product());
  }
}
