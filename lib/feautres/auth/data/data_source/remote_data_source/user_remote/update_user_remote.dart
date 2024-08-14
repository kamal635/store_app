import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../models/user.dart';

abstract class UpdateUserRemoteDataSource {
  Future<Unit> updateUser(UserModel userModel);
}

class UpdateUserRemoteDataSourceImpl implements UpdateUserRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  UpdateUserRemoteDataSourceImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Unit> updateUser(UserModel userModel) async {
    await _firebaseFirestore
        .collection("users")
        .doc(userModel.id)
        .update(userModel.toDocument())
        // ignore: avoid_print
        .then((value) => print("user document updated"));

    return unit;
  }
}
