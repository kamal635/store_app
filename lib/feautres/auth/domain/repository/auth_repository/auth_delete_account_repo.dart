import 'package:dartz/dartz.dart';
import 'package:store_app/core/utils/failure.dart';

abstract class AuthDeleteAccountRepo {
  Future<Either<Failure, Unit>> deleteAccount();
}
