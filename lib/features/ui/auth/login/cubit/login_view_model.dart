import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/entities/request/login/login_request.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/ui/auth/auth_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase) :super(AuthLoadingState());

  //todo: hold data - handle logic

  Future<void> login(String password, String email) async {
    try {
      LoginRequest loginRequest = LoginRequest(
        password: password,
        email: email,
      );
      emit(AuthLoadingState());
      var authResponse = await _loginUseCase.invoke(loginRequest);

      emit(
          AuthSuccessState(authResponse: authResponse));
    } on DioException catch (e) {
      String message = (e.error is AppExceptions) ? (e.error as AppExceptions)
          .message : 'UnExpected Error';
      emit(AuthErrorState(errorMessage: ServerException(message: message)));
    } on AppExceptions catch (e) {
      emit(AuthErrorState(errorMessage: ServerException(message: e.message)));
    }
    catch (e) {
      emit(AuthErrorState(
          errorMessage: UnexpectedException(message: e.toString())));
    }
  }

}


//todo: view => object viewModel
//todo: viewModel => object UseCase
//todo: UseCase => object Repository
//todo: Repository => object Remote DS
//todo: Remote DS => object ApiService
