import 'package:e_commerce/domain/entities/response/cart/add/add_products.dart';

class AddCart {
  final String? id;
  final String? cartOwner;
  final List<AddProducts>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  AddCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
