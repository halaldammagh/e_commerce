import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/auth/auth_response_mapper.dart';
import 'package:e_commerce/api/mapper/auth/login_request_mapper.dart';
import 'package:e_commerce/api/mapper/auth/register_request_mapper.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:e_commerce/domain/entities/request/login/login_request.dart';
import 'package:e_commerce/domain/entities/request/register/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    //todo: LoginRequest => LoginRequestDto
    var authResponse = await _apiServices.login(
      loginRequest.toLoginRequestDto(),
    );

    //todo: save token
    SharedPrefsUtils.saveData(key: 'token', value: authResponse.token ?? "");
    print('EMAIL FROM API: ${authResponse.user?.email}');
    await SharedPrefsUtils.saveData(
      key: 'email',
      value: authResponse.user?.email ?? "",
    );
    print('EMAIL SAVED: ${SharedPrefsUtils.getData(key: 'email')}');
    //todo: AuthResponseDto => AuthResponse
    return authResponse.toAuthResponse();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    //todo: RegisterRequest => RegisterRequestDto
    var authResponse = await _apiServices.register(
      registerRequest.toRegisterRequestDto(),
    );
    //todo: save token
    SharedPrefsUtils.saveData(key: 'token', value: authResponse.token ?? "");

    //todo: AuthResponseDto => AuthResponse
    return authResponse.toAuthResponse();
  }
}
