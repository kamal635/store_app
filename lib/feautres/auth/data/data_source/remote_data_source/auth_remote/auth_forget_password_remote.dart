import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthForgetPasswordRemoteDataSource {
  Future<Unit> forgetPassword(String email);
}

class AuthForgetPasswordRemoteDataSourceImpl
    extends AuthForgetPasswordRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthForgetPasswordRemoteDataSourceImpl({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<Unit> forgetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);

    return Future.value(unit);
  }
}
