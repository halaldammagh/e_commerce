import 'package:e_commerce/domain/entities/response/verify/verify.dart';

class VerifyResponse {
  final String? message;
  final Verify? decoded;

  VerifyResponse({this.message, this.decoded});
}
