import 'package:e_commerce/domain/entities/request/login/login_request.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';
import 'package:e_commerce/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<AuthResponse> invoke(LoginRequest loginRequest) {
    return _authRepository.login(loginRequest);
  }
}
