import 'package:e_commerce/api/mapper/verify/verify_mapper.dart';

import '../../../domain/entities/response/verify/verify_response.dart';
import '../../model/response/verify/verify_response_dto.dart';

extension VerifyResponseMapper on VerifyResponseDto {
  VerifyResponse toVerifyResponse() {
    return VerifyResponse(message: message, decoded: decoded?.toVerify());
  }
}
