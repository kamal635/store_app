import 'package:dartz/dartz.dart';
import '../../../../../core/utils/failure.dart';
import '../../../data/models/user.dart';

abstract class CreateUserRepo {
  Future<Either<Failure, Unit>> createUser(UserModel userModel);
}
