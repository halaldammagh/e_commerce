import 'package:e_commerce/api/model/request/login/login_request_dto.dart';
import 'package:e_commerce/domain/entities/request/login/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
