import '../../repository/auth_repository/auth_get_user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthGetUserUseCase {
  final AuthGetUserRepo authGetUserRepo;
  AuthGetUserUseCase({required this.authGetUserRepo});

  Stream<auth.User?> call() {
    return authGetUserRepo.user;
  }
}
