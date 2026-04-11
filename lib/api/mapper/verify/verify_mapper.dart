import 'package:e_commerce/api/model/response/verify/verify_dto.dart';
import 'package:e_commerce/domain/entities/response/verify/verify.dart';

extension VerifyMapper on VerifyDto {
  Verify toVerify() {
    return Verify(id: id, name: name, exp: exp, iat: iat, role: role);
  }
}
