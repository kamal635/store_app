import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:store_app/core/utils/failure.dart';
import 'package:store_app/feautres/auth/data/data_source/remote_data_source/image_user_remote/image_user_put_file.dart';
import 'package:store_app/feautres/auth/domain/repository/image_user_repository/image_user_put_file.dart';

class ImageUserPutFileRepoImpl implements ImageUserPutFileRepo {
  final ImageUserPutFileRemoteDataSourceImpl
      imageUserPutFileRemoteDataSourceImpl;

  ImageUserPutFileRepoImpl(
      {required this.imageUserPutFileRemoteDataSourceImpl});
  @override
  Future<Either<Failure, String>> putFile(
      String path, File? file, String email) async {
    try {
      final imageUrl =
          await imageUserPutFileRemoteDataSourceImpl.putFile(path, file, email);
      return right(imageUrl);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is FirebaseException) {
        return left(FirebaseStorageFailure.fromFirebaseStorage(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
