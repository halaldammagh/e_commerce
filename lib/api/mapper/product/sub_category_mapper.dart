import 'package:e_commerce/api/model/response/product/sub_category_dto.dart';
import 'package:e_commerce/domain/entities/response/product/sub_category.dart';

extension SubCategoryMapper on SubCategoryDto {
  SubCategory toSubCategory() {
    return SubCategory(category: category, slug: slug, id: id, name: name);
  }
}
