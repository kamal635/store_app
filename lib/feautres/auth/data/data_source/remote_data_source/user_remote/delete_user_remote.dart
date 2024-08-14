import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteUserRemoteDataSource {
  Future<Unit> deleteUser(String id);
}

class DeleteUserRemoteDataSourceImpl implements DeleteUserRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  DeleteUserRemoteDataSourceImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Unit> deleteUser(String id) async {
    await _firebaseFirestore.collection("users").doc(id).delete();
    return unit;
  }
}
