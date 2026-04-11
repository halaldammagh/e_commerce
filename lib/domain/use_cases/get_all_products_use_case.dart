import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/domain/repository/product/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  final ProductRepository _productRepository;

  GetAllProductsUseCase(this._productRepository);

  Future<List<Product>?> invoke() {
    // TODO: implement invoke
    return _productRepository.getAllProducts();
  }
}
