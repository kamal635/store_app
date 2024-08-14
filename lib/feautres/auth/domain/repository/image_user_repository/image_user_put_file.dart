import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:store_app/core/utils/failure.dart';

abstract class ImageUserPutFileRepo {
  Future<Either<Failure, String>> putFile(
      String path, File? file, String email);
}
