import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/dio/dio_interceptors.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  @singleton
  BaseOptions get baseOptions => BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
  );

  @singleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    request: true,
  );

  @singleton
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(PrettyDioLogger());
    return dio;
  }

  @singleton
  ApiServices get apiServices =>
      ApiServices(provideDio(baseOptions, prettyDioLogger));
}

//todo: apiServices => abject dio
//todo: dio => BaseOptions , PrettyDioLogger , Interceptors
