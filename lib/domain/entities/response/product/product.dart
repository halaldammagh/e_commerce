import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/entities/response/product/sub_category.dart';

class Product {
  final int? sold;
  final List<String>? images;
  final List<SubCategory>? subcategory;
  final int? ratingsQuantity;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryOrBrand? category;
  final CategoryOrBrand? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final String? id;

  Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
  });
}
