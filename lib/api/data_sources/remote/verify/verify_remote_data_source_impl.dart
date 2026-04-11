import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/verify/verify_response_mapper.dart';
import 'package:e_commerce/api/mapper/wishlist/add/add_wishlist_mapper.dart';
import 'package:e_commerce/api/mapper/wishlist/delete/delete_wishlist_response_mapper.dart';
import 'package:e_commerce/api/mapper/wishlist/get/get_wishlist_response_mapper.dart';
import 'package:e_commerce/api/model/request/wishlist/add_wishlist_request_dto.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/data/data_sources/remote/verify/verify_remote_data_source.dart';
import 'package:e_commerce/data/data_sources/remote/wishlist/wishlist_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/verify/verify_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/add_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/delete_wishlist_response.dart';
import 'package:e_commerce/domain/entities/response/wishlist/get_wishlist_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyRemoteDataSource)
class VerifyRemoteDataSourceImpl implements VerifyRemoteDataSource {
  final ApiServices _apiServices;

  VerifyRemoteDataSourceImpl(this._apiServices);

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
  Future<VerifyResponse> getUserToken() async {
    try {
      var response = await _apiServices.getUser(_token);
      return response.toVerifyResponse();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}
