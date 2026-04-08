import 'package:e_commerce/data/data_sources/remote/cart/get_cart_remote_data_source.dart';
import 'package:e_commerce/domain/repository/cart/get_cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetCartRepository)
class GetCartRepositoryImpl implements GetCartRepository {
  GetCartRemoteDataSource _getCartRemoteDataSource;

  GetCartRepositoryImpl(this._getCartRemoteDataSource);

  @override
  GetProductToCart() {
    // TODO: implement GetProductToCart
    return _getCartRemoteDataSource.getItemsInCart();
  }
}
