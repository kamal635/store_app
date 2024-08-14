import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../../../../../core/utils/failure.dart';
import '../../repository/auth_repository/auth_login_user_repo.dart';

class AuthLogInUseCase {
  final AuthLoginUserRepo loginUserRepo;

  AuthLogInUseCase({required this.loginUserRepo});

  Future<Either<Failure, auth.User?>> call(
      String email, String password) async {
    return await loginUserRepo.logIn(email: email, password: password);
  }
}
