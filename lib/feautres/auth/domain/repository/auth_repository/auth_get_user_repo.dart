import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class AuthGetUserRepo {
  Stream<auth.User?> get user;
}
