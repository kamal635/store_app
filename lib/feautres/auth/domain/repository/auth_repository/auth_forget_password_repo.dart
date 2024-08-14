import 'package:dartz/dartz.dart';
import '../../../../../core/utils/failure.dart';

abstract class AuthForgetPasswordRepo {
  Future<Either<Failure, Unit>> forgetPassword(String email);
}
