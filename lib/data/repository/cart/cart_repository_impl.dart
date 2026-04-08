import 'package:e_commerce/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<AddProductCartResponse> addProductToCart(String productId) {
    // TODO: implement addProductToCart
    return _cartRemoteDataSource.addProductToCart(productId);
  }

  @override
  Future<GetCartResponse> deleteItemInCart(String productId) {
    // TODO: implement deleteItemInCart
    return _cartRemoteDataSource.deleteItemInCart(productId);
  }

  @override
  Future<GetCartResponse> updateCountInCart(String productId, int count) {
    // TODO: implement updateCountInCart
    return _cartRemoteDataSource.updateCountInCart(productId, count);
  }
}
