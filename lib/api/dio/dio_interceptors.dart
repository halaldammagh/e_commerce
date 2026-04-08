import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppExceptions exception;

    final responseData = err.response?.data;
    String message = 'Something went wrong';

    if (responseData is Map) {
      message =
          responseData['errors']?['msg'] ?? responseData['message'] ?? message;
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        exception = NetworkException(
          message: 'Please check your internet connection',
        );
        break;

      case DioExceptionType.badResponse:
        // ✅ معالجة التوكن المنتهي
        if (err.response?.statusCode == 401) {
          SharedPrefsUtils.removeData(key: 'token');
          exception = UnAuthorizedException(
            message: 'Session expired, please login again',
          );
          break;
        }
        exception = ServerException(
          message: message,
          statusCode: err.response?.statusCode,
        );
        break;

      case DioExceptionType.cancel:
        exception = UnexpectedException(message: 'Request was cancelled');
        break;

      default:
        exception = UnexpectedException(message: message);
    }

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        response: err.response,
        type: err.type,
      ),
    );
  }
}