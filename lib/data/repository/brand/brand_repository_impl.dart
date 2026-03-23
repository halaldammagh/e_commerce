import 'package:e_commerce/data/data_sources/remote/brand/brand_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/repository/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandRepository)
class BrandRepositoryImpl implements BrandRepository {
  BrandRemoteDataSource _brandRemoteDataSource;

  BrandRepositoryImpl(this._brandRemoteDataSource);

  @override
  Future<List<CategoryOrBrand>?> getAllBrands() {
    // TODO: implement getAllBrands

    return _brandRemoteDataSource.getAllBrands();
  }
}
