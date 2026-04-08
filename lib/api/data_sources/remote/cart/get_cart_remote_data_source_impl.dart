import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/cart/get/get_cart_response_mapper.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/data/data_sources/remote/cart/get_cart_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetCartRemoteDataSource)
class GetCartRemoteDataSourceImpl implements GetCartRemoteDataSource {
  final ApiServices _apiServices;

  GetCartRemoteDataSourceImpl(this._apiServices);

  // ✅ helper موحد للتوكن
  String get _token => SharedPrefsUtils.getData(key: 'token').toString();

  @override
  Future<GetCartResponse> getItemsInCart() async {
    try {
      var response = await _apiServices.getItemsInCart(_token);
      return response.toGetCartResponse();
    } on DioException catch (e) {
      if (e.error is AppExceptions) {
        throw e.error as AppExceptions;
      }
      throw ServerException(message: e.message ?? 'Unknown error');
    }
  }
}