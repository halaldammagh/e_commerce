import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist.dart';
import 'package:e_commerce/domain/use_cases/add_product_to_wishlist_use_case.dart';
import 'package:e_commerce/domain/use_cases/delete_products_from_wishlist_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_products_in_wishlist_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/favorite_tab/cubit/favorite_screen_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/exceptions/app_exceptions.dart';
import '../../../../../../../domain/entities/response/wishlist/get_wishlist_response.dart';

@injectable
class FavoriteTabViewModel extends Cubit<FavoriteScreenStatus> {
  AddProductToWishlistUseCase _addProductToWishlistUseCase;
  GetProductsInWishlistUseCase _getProductsInWishlistUseCase;
  DeleteProductsFromWishlistUseCase _deleteProductsFromWishlistUseCase;

  FavoriteTabViewModel(
    this._addProductToWishlistUseCase,
    this._getProductsInWishlistUseCase,
    this._deleteProductsFromWishlistUseCase,
  ) : super(AddProductToFavoriteInitialState());

  static FavoriteTabViewModel get(context) =>
      BlocProvider.of<FavoriteTabViewModel>(context);

  // قائمة IDs المفضلة
  Set<String> favouriteIds = {};

  bool isFavourite(String productId) => favouriteIds.contains(productId);

  //todo: hold data and handle logic
  Future<void> addProductToFavorite(String productId) async {
    if (favouriteIds.contains(productId)) {
      favouriteIds.remove(productId);
    } else {
      favouriteIds.add(productId);
    }
    try {
      var addToWishlistResponse = await _addProductToWishlistUseCase.invoke(
        productId,
      );
      emit(
        AddProductToFavoriteSuccessState(
          wishlistResponse: addToWishlistResponse,
        ),
      );
      print('added successfully to wishlist');
    } on AppExceptions catch (e) {
      // لو فشل — ارجع الحالة اللي كانت
      if (favouriteIds.contains(productId)) {
        favouriteIds.remove(productId);
      } else {
        favouriteIds.add(productId);
      }
      print('AppException: ${e.message}'); // ← شوف الرسالة
      emit(AddProductToFavoriteErrorState(errorMessage: e.message));
    } catch (e) {
      print('Unknown error: $e'); // ← أضف هذا لتشوف أي error تاني
      emit(AddProductToFavoriteErrorState(errorMessage: e.toString()));
    }
  }

  // قائمة الـ items الظاهرة في الشاشة
  List<GetWishlist> wishlistItems = [];

  Future<void> getWishlist() async {
    try {
      var getWishlistResponse = await _getProductsInWishlistUseCase.invoke();
      wishlistItems = getWishlistResponse.data ?? [];
      // املأ favouriteIds
      favouriteIds = wishlistItems.map((product) => product.id ?? '').toSet();
      emit(
        GetProductInWishlistSuccessState(
          getWishlistResponse: getWishlistResponse,
        ),
      );
    } on AppExceptions catch (e) {
      emit(GetProductInWishlistErrorState(errorMessage: e.message));
    }
  }

  Future<void> deleteWishlist(String productId) async {
    // ✅ 1. حذف محلي فوري
    wishlistItems.removeWhere((item) => item.id == productId);
    favouriteIds.remove(productId);

    // ✅ 2. حدث UI فورًا
    emit(
      GetProductInWishlistSuccessState(
        getWishlistResponse: GetWishlistResponse(
          data: List.from(wishlistItems), // مهم: clone
        ),
      ),
    );

    try {
      // ✅ 3. call API
      await _deleteProductsFromWishlistUseCase.invoke(productId);

      // (اختياري) refresh من السيرفر للتأكد
      // await getWishlist();
    } catch (e) {
      // ❗ rollback لو فشل
      await getWishlist();

      emit(DeleteProductFromWishlistErrorState(errorMessage: e.toString()));
    }
  }
}
