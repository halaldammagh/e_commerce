import 'package:e_commerce/domain/entities/response/verify/verify_response.dart';

abstract class VerifyRepository {
  Future<VerifyResponse> getUser();
}
