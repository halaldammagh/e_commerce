//   لانه المودل الموجودة بال entities  بتبقى بيور كلاسيز بس فيها متغيرات وكونستركور
import 'package:e_commerce/domain/entities/response/auth/user.dart';

class AuthResponse {
  final String? message;
  final User? user;
  final String? token;

  AuthResponse ({
    this.message,
    this.user,
    this.token,
  });


}



