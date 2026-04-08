import 'package:e_commerce/domain/entities/response/product/product.dart';

class GetProducts {
  final int? count;
  final String? id;
  final Product? product;
  final int? price;

  GetProducts({this.count, this.id, this.product, this.price});
}
