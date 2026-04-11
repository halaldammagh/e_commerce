import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/use_cases/get_user_token_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screens/tabs/user_tab/cubit/user_tab_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserTabViewModel extends Cubit<UserTabStatus> {
  GetUserTokenUseCase _getUserTokenUseCase;

  UserTabViewModel(this._getUserTokenUseCase) : super(GetUserLoadingState());

  void getUserToken() async {
    try {
      var verifyResponse = await _getUserTokenUseCase.invoke();
      emit(GetUserSuccessState(verifyResponse: verifyResponse));
    } on AppExceptions catch (e) {
      emit(GetUserErrorState(errorMessage: e.message));
    }
  }
}
