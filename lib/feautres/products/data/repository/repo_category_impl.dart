import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../../../../core/utils/failure.dart';
import '../data_source/local_data_source.dart/category_local_data_source.dart';
import '../data_source/remote_data_source/category_remote_data_source.dart';
import '../../domain/repository/repo_category.dart';

import '../../domain/entities/category_entity.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryRemoteDataSourceImpl categoryRemoteDataSourceImpl;
  final CategoryLocalDataSourceImpl categoryLocalDataSourceImpl;
  CategoryRepoImpl(
      {required this.categoryRemoteDataSourceImpl,
      required this.categoryLocalDataSourceImpl});
  @override
  Future<Either<Failure, List<CategoryEntity>>> get() async {
    // category from local
    List<CategoryEntity> categoryLocal = await getCategoryFromLocal();
    if (categoryLocal.isNotEmpty) {
      return right(categoryLocal);
    }

    try {
      // category from api
      final categoryRemote = await categoryRemoteDataSourceImpl.getCategory();

      return right(categoryRemote);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(message: e.toString()));
    }
  }

  Future<List<CategoryEntity>> getCategoryFromLocal() async {
    Box box = await categoryLocalDataSourceImpl.openBox();
    final categoryLocal = await categoryLocalDataSourceImpl.getCategory(box);
    return categoryLocal;
  }
}
