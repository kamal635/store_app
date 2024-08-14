import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class AuthLogInRemoteDataSource {
  Future<auth.User?> login({required String email, required String password});
}

class AuthLogInRemoteDataSourceImpl implements AuthLogInRemoteDataSource {
  final auth.FirebaseAuth _firebaseAuth;

  AuthLogInRemoteDataSourceImpl({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> login(
      {required String email, required String password}) async {
    final credintial = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    final user = credintial.user;
    return user;
  }
}
