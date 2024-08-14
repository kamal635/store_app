import 'package:dartz/dartz.dart';
import '../../../../../core/utils/failure.dart';

abstract class AuthSignOutUserRepo {
  Future<Either<Failure, Unit>> signOut();
}
