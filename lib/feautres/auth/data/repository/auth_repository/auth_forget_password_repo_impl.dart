import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/failure.dart';
import '../../data_source/remote_data_source/auth_remote/auth_forget_password_remote.dart';
import '../../../domain/repository/auth_repository/auth_forget_password_repo.dart';

class AuthForgetPasswordRepoImpl implements AuthForgetPasswordRepo {
  final AuthForgetPasswordRemoteDataSourceImpl
      forgetPasswordRemoteDataSourceImpl;

  AuthForgetPasswordRepoImpl(
      {required this.forgetPasswordRemoteDataSourceImpl});

  @override
  Future<Either<Failure, Unit>> forgetPassword(String email) async {
    try {
      await forgetPasswordRemoteDataSourceImpl.forgetPassword(email);
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email' &&
            e.code == 'user-not-found' &&
            e.code == 'user-disabled') {
          return left(EmailAuthFailure.fromFirebase(e));
        } else {
          return left(FirebaseAuthFailure.fromFirebase(e));
        }
      } else {
        return left(ServerFailure(
            message: "Server Failure error forget password${e.toString()}"));
      }
    }
  }
}
