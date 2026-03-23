import 'package:e_commerce/api/model/response/common/category_or_brand_dto.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';

extension CategoryBrandMapper on CategoryOrBrandDto {
  CategoryOrBrand toCategoryOrBrand() {
    return CategoryOrBrand(
      updatedAt: updatedAt,
      slug: slug,
      createdAt: createdAt,
      id: id,
      name: name,
      image: image,
    );
  }
}
