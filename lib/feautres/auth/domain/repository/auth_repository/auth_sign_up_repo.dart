import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../../../../../core/utils/failure.dart';

abstract class AuthSignUpUserRepo {
  Future<Either<Failure, auth.User?>> signUp({
    required String email,
    required String password,
  });
}
