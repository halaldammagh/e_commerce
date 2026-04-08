import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_products.dart';
import 'package:e_commerce/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:e_commerce/features/ui/pages/%20cart_screen/cubit/cart_screen_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenStatus> {
  final AddToCartUseCase _addToCartUseCase;
  final GetCartUseCase _getCartUseCase;
  final DeleteItemInCartUseCase _deleteItemInCartUseCase;
  final UpdateCountInCartUseCase _updateCountInCartUseCase;

  static CartScreenViewModel get(context) =>
      BlocProvider.of<CartScreenViewModel>(context);

  List<GetProducts> productsList = [];

  CartScreenViewModel(
    this._addToCartUseCase,
    this._getCartUseCase,
    this._updateCountInCartUseCase,
    this._deleteItemInCartUseCase,
  ) : super(AddProductToCartInitialState());

  //todo: hold data and handle logic
  int numOfCartItem = 0;

  Future<void> addProductToCart(String productId) async {
    try {
      var addToCartResponse = await _addToCartUseCase.invoke(productId);
      numOfCartItem = addToCartResponse.numOfCartItems ?? 0;
      emit(AddProductToCartSuccessState(cartResponse: addToCartResponse));
    } on AppExceptions catch (e) {
      print('AppException: ${e.message}'); // ← شوف الرسالة
      emit(AddProductToCartErrorState(errorMessage: e.message));
    } catch (e) {
      print('Unknown error: $e'); // ← أضف هذا لتشوف أي error تاني
      emit(AddProductToCartErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getItemsInCart() async {
    try {
      var getCartResponse = await _getCartUseCase.invoke();
      numOfCartItem = getCartResponse.numOfCartItems ?? 0;
      productsList = getCartResponse.data?.products ?? [];
      emit(GetItemInCartSuccessState(getCartResponse: getCartResponse));
    } on AppExceptions catch (e) {
      emit(GetItemInCartErrorState(errorMessage: e.message));
    }
  }

  Future<void> deleteItemInCart(String productId) async {
    try {
      var deleteItemInCartResponse = await _deleteItemInCartUseCase.invoke(
        productId,
      );
      numOfCartItem = deleteItemInCartResponse.numOfCartItems ?? 0;
      productsList = deleteItemInCartResponse.data?.products ?? [];
      print('delete successfully');
      emit(
        GetItemInCartSuccessState(getCartResponse: deleteItemInCartResponse),
      );
    } on AppExceptions catch (e) {
      emit(deleteItemInCartErrorState(errorMessage: e.message));
    }
  }

  Future<void> updateCountInCart(String productId, int count) async {
    try {
      var updateCountInCartResponse = await _updateCountInCartUseCase.invoke(
        productId,
        count,
      );
      print('update successfully');
      emit(
        GetItemInCartSuccessState(getCartResponse: updateCountInCartResponse),
      );
    } on AppExceptions catch (e) {
      emit(updateCountInCartErrorState(errorMessage: e.message));
    }
  }

  // increment و decrement بدل setState في الـ widget
  Future<void> incrementCount(String productId, int currentCount) async {
    final newCount = currentCount + 1;
    await updateCountInCart(productId, newCount);
  }

  Future<void> decrementCount(String productId, int currentCount) async {
    if (currentCount <= 1) return; // ✅ ما ننزل تحت 1
    final newCount = currentCount - 1;
    await updateCountInCart(productId, newCount);
  }
}
