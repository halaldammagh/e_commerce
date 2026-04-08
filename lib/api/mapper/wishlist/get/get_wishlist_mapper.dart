import 'package:e_commerce/api/mapper/category_brand/category_brand_mapper.dart';
import 'package:e_commerce/api/model/response/wishlist/get/get_wishlist_dto.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist.dart';

import '../../product/sub_category_mapper.dart';

extension GetWishlistMapper on GetWishlistDto {
  GetWishlist toGetWishlist() {
    return GetWishlist(
      price: price,
      id: id,
      V: V,
      createdAt: createdAt,
      updatedAt: updatedAt,
      category: category!.toCategoryOrBrand(),
      slug: slug,
      brand: brand!.toCategoryOrBrand(),
      sold: sold,
      ratingsQuantity: ratingsQuantity,
      ratingsAverage: ratingsAverage,
      quantity: quantity,
      images: images,
      imageCover: imageCover,
      title: title,
      description: description,
      subcategory: subcategory
          ?.map((subDto) => subDto.toSubCategory())
          .toList(),
    );
  }
}
