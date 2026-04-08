import 'package:e_commerce/domain/entities/response/product/product.dart';

class ProductTabStatus {}

class ProductTabInitialState extends ProductTabStatus {}

class ProductLoadingState extends ProductTabStatus {}

class ProductErrorState extends ProductTabStatus {
  String errorMessage;

  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductTabStatus {
  List<Product>? productList;

  ProductSuccessState({required this.productList});
}

