import 'package:e_commerce/domain/entities/response/verify/verify_response.dart';
import 'package:e_commerce/domain/repository/verify/verify_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserTokenUseCase {
  final VerifyRepository _verifyRepository;

  GetUserTokenUseCase(this._verifyRepository);

  Future<VerifyResponse> invoke() {
    return _verifyRepository.getUser();
  }
}
