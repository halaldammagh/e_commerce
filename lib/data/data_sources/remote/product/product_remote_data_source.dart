import 'package:e_commerce/domain/entities/response/product/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>?> getAllProducts();
}
