import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/failure.dart';
import '../../data_source/remote_data_source/user_remote/create_user_remote.dart';
import '../../models/user.dart';
import '../../../domain/repository/user_repository/create_user_repo.dart';

class CreateUserRepoImpl implements CreateUserRepo {
  final CreateUserRemoteDataSourceImpl createUserRemoteDataSourceImpl;

  CreateUserRepoImpl({required this.createUserRemoteDataSourceImpl});

  @override
  Future<Either<Failure, Unit>> createUser(UserModel userModel) async {
    try {
      await createUserRemoteDataSourceImpl.createUser(userModel);
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
