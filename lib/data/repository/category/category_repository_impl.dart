import 'package:e_commerce/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/repository/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoryImpl(this._categoryRemoteDataSource);

  @override
  Future<List<CategoryOrBrand>?> getAllCategories() {
    // TODO: implement getAllCategories

    return _categoryRemoteDataSource.getAllCategories();
  }
}
