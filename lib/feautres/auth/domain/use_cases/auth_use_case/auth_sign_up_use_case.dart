import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../../../core/utils/failure.dart';
import '../../repository/auth_repository/auth_sign_up_repo.dart';

class AuthSignUpUseCase {
  final AuthSignUpUserRepo signUpUserRepo;
  AuthSignUpUseCase({required this.signUpUserRepo});

  Future<Either<Failure, auth.User?>> call(
      String email, String password) async {
    return await signUpUserRepo.signUp(email: email, password: password);
  }
}
