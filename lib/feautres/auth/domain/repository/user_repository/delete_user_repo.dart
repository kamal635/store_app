import 'package:dartz/dartz.dart';
import '../../../../../core/utils/failure.dart';

abstract class DeleteUserRepo {
  Future<Either<Failure, Unit>> deleteUser(String userId);
}
