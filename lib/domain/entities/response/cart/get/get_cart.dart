import 'package:e_commerce/domain/entities/response/cart/get/get_products.dart';

class GetCart {
  final String? id;

  final String? cartOwner;

  final List<GetProducts>? products;

  final String? createdAt;

  final String? updatedAt;
  final int? V;
  final int? totalCartPrice;

  GetCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.V,
    this.totalCartPrice,
  });
}
