import 'package:dartz/dartz.dart';

import '../../../../../core/utils/failure.dart';
import '../../repository/user_repository/delete_user_repo.dart';

class DeleteUserUseCase {
  final DeleteUserRepo deleteUserRepo;

  DeleteUserUseCase({required this.deleteUserRepo});

  Future<Either<Failure, Unit>> deleteUser(String id) async {
    return await deleteUserRepo.deleteUser(id);
  }
}
