import 'package:dartz/dartz.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../../../core/utils/failure.dart';
import '../../repository/user_repository/update_user_repo.dart';

class UpdateUserUseCase extends UseCaseParam {
  final UpdateUserRepo updateUserRepo;

  UpdateUserUseCase({required this.updateUserRepo});
  @override
  Future<Either<Failure, dynamic>> call(param) async {
    return await updateUserRepo.updateUser(param);
  }
}
