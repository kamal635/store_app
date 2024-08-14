import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/failure.dart';
import '../../data_source/remote_data_source/auth_remote/auth_login_remote.dart';
import '../../../domain/repository/auth_repository/auth_login_user_repo.dart';

class AuthLoginUserRepoImpl implements AuthLoginUserRepo {
  final AuthLogInRemoteDataSourceImpl authLogInRemoteDataSourceImpl;

  AuthLoginUserRepoImpl({required this.authLogInRemoteDataSourceImpl});
  @override
  Future<Either<Failure, User?>> logIn(
      {required String email, required String password}) async {
    try {
      final user = await authLogInRemoteDataSourceImpl.login(
          email: email, password: password);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email' ||
            e.code == 'user-not-found' ||
            e.code == 'user-disabled' ||
            e.code == 'INVALID_LOGIN_CREDENTIALS' ||
            e.code == 'account-exists-with-different-credential') {
          return left(EmailAuthFailure.fromFirebase(e));
        } else if (e.code == 'wrong-password' ||
            e.code == 'INVALID_LOGIN_CREDENTIALS') {
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
