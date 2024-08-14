import '../../domain/entity/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? id,
    String fullName = "",
    String email = "",
    String address = "",
    String city = "",
    String country = "",
    String zipCode = "",
  }) : super(
          id: id,
          fullName: fullName,
          email: email,
          address: address,
          city: city,
          country: country,
          zipCode: zipCode,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap.id,
      fullName: snap["fullName"],
      email: snap["email"],
      address: snap["address"],
      city: snap["city"],
      country: snap["country"],
      zipCode: snap["zipCode"],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "address": address,
      "city": city,
      "country": country,
      "zipCode": zipCode,
    };
  }

  @override
  List<Object?> get props =>
      [id, fullName, email, address, city, country, zipCode];
}
