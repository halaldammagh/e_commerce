import 'package:e_commerce/data/data_sources/remote/verify/verify_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/verify/verify_response.dart';
import 'package:e_commerce/domain/repository/verify/verify_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyRepository)
class VerifyRepositoryImpl implements VerifyRepository {
  VerifyRemoteDataSource _verifyRemoteDataSource;

  VerifyRepositoryImpl(this._verifyRemoteDataSource);

  @override
  Future<VerifyResponse> getUser() {
    // TODO: implement getUser
    return _verifyRemoteDataSource.getUserToken();
  }
}
