import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/core/utils/failure.dart';
import 'package:store_app/feautres/auth/domain/repository/auth_repository/auth_google_sign_in_repo.dart';

class AuthGoogleSignInUseCase {
  final AuthGoogleSignInRepo authSignInGoogleRepo;

  AuthGoogleSignInUseCase({required this.authSignInGoogleRepo});
  Future<Either<Failure, UserCredential>> googleSignIn() async {
    return await authSignInGoogleRepo.googleSignIn();
  }
}
