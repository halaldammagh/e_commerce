import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/entities/response/common/meta_data.dart';

class CategoryOrBrandResponse {
  final int? results;
  final Metadata? metadata;
  final List<CategoryOrBrand>? data;

  CategoryOrBrandResponse({this.results, this.metadata, this.data});
}
