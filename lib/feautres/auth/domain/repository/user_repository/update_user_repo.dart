import 'package:dartz/dartz.dart';

import '../../../../../core/utils/failure.dart';
import '../../../data/models/user.dart';

abstract class UpdateUserRepo {
  Future<Either<Failure, Unit>> updateUser(UserModel userModel);
}
