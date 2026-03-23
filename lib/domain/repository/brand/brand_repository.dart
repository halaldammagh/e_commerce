import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';

abstract class BrandRepository {
  Future<List<CategoryOrBrand>?> getAllBrands();
}
