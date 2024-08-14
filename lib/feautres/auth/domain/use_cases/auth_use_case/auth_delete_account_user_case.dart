import 'package:dartz/dartz.dart';
import 'package:store_app/core/utils/failure.dart';
import 'package:store_app/feautres/auth/domain/repository/auth_repository/auth_delete_account_repo.dart';

class AuthDeleteAccountUseCase {
  final AuthDeleteAccountRepo authDeleteAccountRepo;

  AuthDeleteAccountUseCase({required this.authDeleteAccountRepo});
  Future<Either<Failure, Unit>> deleteAccount() async {
    return await authDeleteAccountRepo.deleteAccount();
  }
}
