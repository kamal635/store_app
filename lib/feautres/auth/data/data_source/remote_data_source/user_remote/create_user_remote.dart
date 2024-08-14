import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../models/user.dart';

abstract class CreateUserRemoteDataSource {
  Future<Unit> createUser(UserModel userModel);
}

class CreateUserRemoteDataSourceImpl implements CreateUserRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  CreateUserRemoteDataSourceImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Unit> createUser(UserModel userModel) async {
    await _firebaseFirestore
        .collection("users")
        .doc(userModel.id)
        .set(userModel.toDocument());

    return unit;
  }
}
