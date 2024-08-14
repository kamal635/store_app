import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/utils/failure.dart';
import '../../../domain/repository/user_repository/delete_user_repo.dart';
import '../../data_source/remote_data_source/user_remote/delete_user_remote.dart';

class DeleteUserRepoImpl implements DeleteUserRepo {
  final DeleteUserRemoteDataSourceImpl deleteUserRemoteDataSourceImpl;

  DeleteUserRepoImpl({required this.deleteUserRemoteDataSourceImpl});

  @override
  Future<Either<Failure, Unit>> deleteUser(String userId) async {
    try {
      await deleteUserRemoteDataSourceImpl.deleteUser(userId);
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
