import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/core/utils/failure.dart';
import 'package:store_app/feautres/auth/data/data_source/remote_data_source/auth_remote/auth_google_sign_in_remote.dart';
import 'package:store_app/feautres/auth/domain/repository/auth_repository/auth_google_sign_in_repo.dart';

class AuthGoogleSignInRepoImpl implements AuthGoogleSignInRepo {
  final AuthGoogleSignInRemoteDataSourceImpl
      authGoogleSignInRemoteDataSourceImpl;

  AuthGoogleSignInRepoImpl(
      {required this.authGoogleSignInRemoteDataSourceImpl});
  @override
  Future<Either<Failure, UserCredential>> googleSignIn() async {
    try {
      final cred = await authGoogleSignInRemoteDataSourceImpl.googleSignIn();
      return right(cred);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebase(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
