import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

sealed class CartScreenStatus {}

class AddProductToCartInitialState extends CartScreenStatus {}

class AddProductToCartLoadingState extends CartScreenStatus {}

class AddProductToCartErrorState extends CartScreenStatus {
  String errorMessage;

  AddProductToCartErrorState({required this.errorMessage});
}

class AddProductToCartSuccessState extends CartScreenStatus {
  AddProductCartResponse cartResponse;

  AddProductToCartSuccessState({required this.cartResponse});
}

class GetItemInCartLoadingState extends CartScreenStatus {}

class GetItemInCartErrorState extends CartScreenStatus {
  String errorMessage;

  GetItemInCartErrorState({required this.errorMessage});
}

class GetItemInCartSuccessState extends CartScreenStatus {
  GetCartResponse getCartResponse;

  GetItemInCartSuccessState({required this.getCartResponse});
}

class deleteItemInCartErrorState extends CartScreenStatus {
  String errorMessage;

  deleteItemInCartErrorState({required this.errorMessage});
}

class deleteItemInCartSuccessState extends CartScreenStatus {
  GetCartResponse getCartResponse;

  deleteItemInCartSuccessState({required this.getCartResponse});
}

class updateCountInCartErrorState extends CartScreenStatus {
  String errorMessage;

  updateCountInCartErrorState({required this.errorMessage});
}

class updateCountInCartSuccessState extends CartScreenStatus {
  GetCartResponse getCartResponse;

  updateCountInCartSuccessState({required this.getCartResponse});
}
