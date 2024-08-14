import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class AuthSignUpRemoteDataSource {
  Future<auth.User?> signUp({required String email, required String password});
}

class AuthSignUpRemoteDataSourceImpl implements AuthSignUpRemoteDataSource {
  final auth.FirebaseAuth _firebaseAuth;

  AuthSignUpRemoteDataSourceImpl({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;
  @override
  Future<auth.User?> signUp({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = credential.user;
    return user;
  }
}
