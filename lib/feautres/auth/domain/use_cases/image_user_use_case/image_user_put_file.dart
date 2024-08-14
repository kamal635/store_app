import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:store_app/core/utils/failure.dart';
import 'package:store_app/feautres/auth/domain/repository/image_user_repository/image_user_put_file.dart';

class ImageUserPutFileUseCase {
  final ImageUserPutFileRepo imageUserPutFileRepo;

  ImageUserPutFileUseCase({required this.imageUserPutFileRepo});

  Future<Either<Failure, String>> putFile(
      String path, File? file, String email) async {
    return await imageUserPutFileRepo.putFile(path, file, email);
  }
}
