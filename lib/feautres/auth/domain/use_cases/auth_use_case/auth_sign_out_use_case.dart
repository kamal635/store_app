import 'package:dartz/dartz.dart';
import '../../../../../core/utils/failure.dart';
import '../../repository/auth_repository/auth_sign_out_repo.dart';

class AuthSignOutUseCase {
  final AuthSignOutUserRepo signOutUserRepo;

  AuthSignOutUseCase({required this.signOutUserRepo});

  Future<Either<Failure, Unit>> call() async {
    return await signOutUserRepo.signOut();
  }
}
