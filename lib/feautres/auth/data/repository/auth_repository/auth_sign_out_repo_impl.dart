import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/utils/failure.dart';
import '../../../domain/repository/auth_repository/auth_sign_out_repo.dart';
import '../../data_source/remote_data_source/auth_remote/auth_sign_out_remote.dart';

class AuthSignOutUserRepoImpl implements AuthSignOutUserRepo {
  final AuthSignOutRemoteDataSourceImpl authSignOutRemoteDataSourceImpl;

  AuthSignOutUserRepoImpl({required this.authSignOutRemoteDataSourceImpl});

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await authSignOutRemoteDataSourceImpl.signOut();
      return right(unit);
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
