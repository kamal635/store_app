import 'package:dartz/dartz.dart';

import '../utils/failure.dart';

abstract class UseCaseParam<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}
