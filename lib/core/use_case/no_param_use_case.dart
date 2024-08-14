import 'package:dartz/dartz.dart';

import '../utils/failure.dart';

abstract class UseCaseNoParam<Type> {
  Future<Either<Failure, Type>> call();
}
