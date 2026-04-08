import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/api/mapper/cart/get/get_cart_response_mapper.dart';
import 'package:e_commerce/api/model/request/cart/add/add_cart_request_dto.dart';
import 'package:e_commerce/api/model/request/cart/update/count_request_dto.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiServices _apiServices;

  CartRemoteDataSourceImpl(this._apiServices);

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
  Future<AddProductCartResponse> addProductToCart(String productId) async {
    try {
      AddCartRequestDto addCart = AddCartRequestDto(productId: productId);
      var response = await _apiServices.addProductToCart(addCart, _token);
      return response.toAddProductCartResponse();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<GetCartResponse> getCart() async {
    try {
      var response = await _apiServices.getItemsInCart(_token);
      return response.toGetCartResponse();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<GetCartResponse> deleteItemInCart(String productId) async {
    try {
      var deleteItemCartResponse = await _apiServices.deleteItemInCart(
        productId,
        _token,
      );
      return deleteItemCartResponse.toGetCartResponse();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<GetCartResponse> updateCountInCart(String productId, int count) async {
    try {
      CountRequestDto countRequest = CountRequestDto(count: '$count');
      var response = await _apiServices.updateCountInCart(
        productId,
        _token,
        countRequest,
      );
      return response.toGetCartResponse();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}
