import 'package:e_commerce/domain/entities/response/product/product.dart';

abstract class ProductRepository {
  Future<List<Product>?> getAllProducts();
}
