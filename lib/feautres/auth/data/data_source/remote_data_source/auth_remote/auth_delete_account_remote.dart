import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDeleteAccountRemoteDataSource {
  Future<Unit> deleteAccount();
}

class AuthDeleteAccountRemoteDataSourceImpl
    implements AuthDeleteAccountRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthDeleteAccountRemoteDataSourceImpl({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  @override
  Future<Unit> deleteAccount() async {
    User? user = _firebaseAuth.currentUser;
    await user?.delete();
    return unit;
  }
}
