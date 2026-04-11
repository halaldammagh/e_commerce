import 'package:e_commerce/data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:e_commerce/domain/entities/request/login/login_request.dart';
import 'package:e_commerce/domain/entities/request/register/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';
import 'package:e_commerce/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return _authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    return _authRemoteDataSource.register(registerRequest);
  }
}
