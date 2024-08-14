import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class AuthSignOutRemoteDataSource {
  Future<Unit> signOut();
}

class AuthSignOutRemoteDataSourceImpl implements AuthSignOutRemoteDataSource {
  final auth.FirebaseAuth _firebaseAuth;

  AuthSignOutRemoteDataSourceImpl({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;
  @override
  Future<Unit> signOut() async {
    await _firebaseAuth.signOut();
    return unit;
  }
}
