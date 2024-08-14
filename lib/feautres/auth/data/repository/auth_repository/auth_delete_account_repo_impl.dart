import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/core/utils/failure.dart';
import 'package:store_app/feautres/auth/data/data_source/remote_data_source/auth_remote/auth_delete_account_remote.dart';
import 'package:store_app/feautres/auth/domain/repository/auth_repository/auth_delete_account_repo.dart';

class AuthDeleteAccountRepoImpl implements AuthDeleteAccountRepo {
  final AuthDeleteAccountRemoteDataSourceImpl
      authDeleteAccountRemoteDataSourceImpl;

  AuthDeleteAccountRepoImpl(
      {required this.authDeleteAccountRemoteDataSourceImpl});
  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    try {
      await authDeleteAccountRemoteDataSourceImpl.deleteAccount();
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebase(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
