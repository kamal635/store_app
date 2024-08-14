import 'package:dartz/dartz.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../core/utils/failure.dart';
import '../../repository/user_repository/create_user_repo.dart';

class CreateUserUseCase extends UseCaseParam {
  final CreateUserRepo createUserRepo;

  CreateUserUseCase({required this.createUserRepo});
  @override
  Future<Either<Failure, Unit>> call(param) async {
    return await createUserRepo.createUser(param);
  }
}
