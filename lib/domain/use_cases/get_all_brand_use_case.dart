import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/repository/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandUseCase {
  final BrandRepository _brandRepository;

  GetAllBrandUseCase(this._brandRepository);

  Future<List<CategoryOrBrand>?> invoke() {
    // TODO: implement invoke
    return _brandRepository.getAllBrands();
  }
}
