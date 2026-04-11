import 'package:e_commerce/domain/entities/request/login/login_request.dart';
import 'package:e_commerce/domain/entities/request/register/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);
}
