import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/product/product_mapper.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/data/data_sources/remote/product/product_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiServices _apiServices;

  ProductRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<Product>?> getAllProducts() async {
    try {
      var productResponse = await _apiServices.getAllProducts();
      return productResponse.data
              ?.map((prodDto) => prodDto.toProduct())
              .toList() ??
          [];
    } on DioException catch (e) {
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}
