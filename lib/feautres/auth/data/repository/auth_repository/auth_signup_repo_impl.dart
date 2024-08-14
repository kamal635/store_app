import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/utils/failure.dart';
import '../../../domain/repository/auth_repository/auth_sign_up_repo.dart';
import '../../data_source/remote_data_source/auth_remote/auth_sign_up_remote.dart';

class AuthSignUpUserRepoImpl implements AuthSignUpUserRepo {
  final AuthSignUpRemoteDataSourceImpl authSignUpRemoteDataSourceImpl;

  AuthSignUpUserRepoImpl({required this.authSignUpRemoteDataSourceImpl});
  @override
  Future<Either<Failure, User?>> signUp(
      {required String email, required String password}) async {
    try {
      final user = await authSignUpRemoteDataSourceImpl.signUp(
          email: email, password: password);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email' ||
            e.code == 'user-not-found' ||
            e.code == 'user-disabled' ||
            e.code == 'email-already-in-use' ||
            e.code == 'account-exists-with-different-credential') {
          return left(EmailAuthFailure.fromFirebase(e));
        } else if (e.code == 'wrong-password' || e.code == 'weak-password') {
          return left(PasswordAuthFailure.fromFirebase(e));
        } else {
          return left(FirebaseAuthFailure.fromFirebase(e));
        }
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
