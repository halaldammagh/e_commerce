import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/wishlist/add/add_wishlist_mapper.dart';
import 'package:e_commerce/api/mapper/wishlist/delete/delete_wishlist_response_mapper.dart';
import 'package:e_commerce/api/mapper/wishlist/get/get_wishlist_response_mapper.dart';
import 'package:e_commerce/api/model/request/wishlist/add_wishlist_request_dto.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/data/data_sources/remote/wishlist/wishlist_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/wishlist/add_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/delete_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final ApiServices _apiServices;

  WishlistRemoteDataSourceImpl(this._apiServices);

  // ✅ helper موحد للتوكن
  String get _token => SharedPrefsUtils.getData(key: 'token').toString();

  // ✅ helper موحد للـ error handling
  Never _handleDioError(DioException e) {
    if (e.error is AppExceptions) {
      throw e.error as AppExceptions;
    }
    throw ServerException(message: e.message ?? 'Unknown error');
  }

  @override
  Future<AddWishlistResponse> addProductToWishlist(String productId) async {
    try {
      AddWishlistRequestDto addWishlist = AddWishlistRequestDto(
        productId: productId,
      );
      var response = await _apiServices.addToFav(addWishlist, _token);
      return response.toAddWishlistResponse();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<GetWishlistResponse> getProductInWishlist() async {
    try {
      var response = await _apiServices.getFavProduct(_token);
      return response.toGetWishlistResponse();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<DeleteWishlistResponse> deleteProductFromWishlist(
    String productId,
  ) async {
    // TODO: implement deleteProductFromWishlist
    try {
      var deleteProductFromWishlistResponse = await _apiServices
          .deleteItemInWishlist(productId, _token);
      return deleteProductFromWishlistResponse.toDeleteWishlistResponse();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}
