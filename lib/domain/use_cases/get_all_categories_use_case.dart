import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/repository/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  GetAllCategoriesUseCase(this._categoryRepository);

  Future<List<CategoryOrBrand>?> invoke() {
    // TODO: implement invoke
    return _categoryRepository.getAllCategories();
  }
}
