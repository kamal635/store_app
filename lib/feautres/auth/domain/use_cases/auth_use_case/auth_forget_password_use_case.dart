import 'package:dartz/dartz.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../core/utils/failure.dart';
import '../../repository/auth_repository/auth_forget_password_repo.dart';

class AuthForgetPasswordUseCase extends UseCaseParam {
  final AuthForgetPasswordRepo authForgetPasswordRepo;
  AuthForgetPasswordUseCase({required this.authForgetPasswordRepo});

  @override
  Future<Either<Failure, Unit>> call(param) async {
    return await authForgetPasswordRepo.forgetPassword(param);
  }
}
