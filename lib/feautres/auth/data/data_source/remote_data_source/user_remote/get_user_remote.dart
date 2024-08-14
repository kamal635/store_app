import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/user.dart';

abstract class GetUserRemoteDataSource {
  Stream<UserModel> getUser(String id);
}

class GetUserRemoteDataSourceImpl implements GetUserRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  GetUserRemoteDataSourceImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<UserModel> getUser(String id) {
    return _firebaseFirestore
        .collection("users")
        .doc(id)
        .snapshots()
        .map((snap) {
      if (snap.exists) {
        return UserModel.fromSnapshot(snap);
      } else {
        throw Exception("user does not exist");
      }
    });
  }
}
