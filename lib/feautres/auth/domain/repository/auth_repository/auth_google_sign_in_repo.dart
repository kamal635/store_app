import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/core/utils/failure.dart';

abstract class AuthGoogleSignInRepo {
  Future<Either<Failure, UserCredential>> googleSignIn();
}
