import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/entities/request/register/register_request.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/features/ui/auth/auth_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase) : super(AuthLoadingState());

  //todo: hold data - handle logic

  Future<void> register({
    required String password,
    required String email,
    required String phone,
    required String name,
    required String rePassword,
  }) async {
    try {
      RegisterRequest registerRequest = RegisterRequest(
        password: password,
        email: email,
        phone: phone,
        name: name,
        rePassword: rePassword,
      );
      emit(AuthLoadingState());
      var authResponse = await _registerUseCase.invoke(registerRequest);

      emit(AuthSuccessState(authResponse: authResponse));
    } on DioException catch (e) {
      String message = (e.error is AppExceptions)
          ? (e.error as AppExceptions).message
          : 'UnExpected Error';
      emit(AuthErrorState(errorMessage: ServerException(message: message)));
    } on AppExceptions catch (e) {
      emit(AuthErrorState(errorMessage: ServerException(message: e.message)));
    } catch (e) {
      emit(
        AuthErrorState(
          errorMessage: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }
}

//todo: view => object viewModel
//todo: viewModel => object UseCase
//todo: UseCase => object Repository
//todo: Repository => object Remote DS
//todo: Remote DS => object ApiService
