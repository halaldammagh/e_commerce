import 'package:e_commerce/domain/entities/response/verify/verify_response.dart';

class UserTabStatus {}

class GetUserInitialState extends UserTabStatus {}

class GetUserLoadingState extends UserTabStatus {}

class GetUserErrorState extends UserTabStatus {
  String errorMessage;

  GetUserErrorState({required this.errorMessage});
}

class GetUserSuccessState extends UserTabStatus {
  VerifyResponse verifyResponse;

  GetUserSuccessState({required this.verifyResponse});
}
