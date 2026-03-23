import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';

abstract class BrandRemoteDataSource {
  Future<List<CategoryOrBrand>?> getAllBrands();
}
