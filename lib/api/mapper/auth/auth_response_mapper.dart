import 'package:e_commerce/api/mapper/auth/user_mapper.dart';
import 'package:e_commerce/api/model/response/auth/auth_response_dto.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';

extension AuthResponseMapper on AuthResponseDto {
  AuthResponse toAuthResponse() {
    return AuthResponse(user: user?.toUser(), message: message, token: token);
  }
}
