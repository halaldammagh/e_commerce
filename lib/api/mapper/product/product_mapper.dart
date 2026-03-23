import 'package:e_commerce/api/mapper/category_brand/category_brand_mapper.dart';
import 'package:e_commerce/api/mapper/product/sub_category_mapper.dart';
import 'package:e_commerce/api/model/response/product/product_dto.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';

extension ProductMapper on ProductDto {
  Product toProduct() {
    return Product(
      createdAt: createdAt,
      id: id,
      slug: slug,
      updatedAt: updatedAt,
      title: title,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      brand: brand?.toCategoryOrBrand(),
      category: category?.toCategoryOrBrand(),
      //todo: List<subcategoryDto> => List<subcategory>
      subcategory: subcategory
          ?.map((subDto) => subDto.toSubCategory())
          .toList(),
    );
  }
}
