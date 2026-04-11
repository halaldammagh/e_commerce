import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/category_brand/category_brand_mapper.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/data/data_sources/remote/brand/brand_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  final ApiServices _apiServices;

  BrandRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<CategoryOrBrand>?> getAllBrands() async {
    try {
      // TODO: implement getAllBrands
      var brandResponse = await _apiServices.getAllBrands();
      //todo: List<CategoryOrBrandDto> => List<CategoryOrBrand>
      return brandResponse.data
          ?.map((brandDto) => brandDto.toCategoryOrBrand())
          .toList();
    } on DioException catch (e) {
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}
