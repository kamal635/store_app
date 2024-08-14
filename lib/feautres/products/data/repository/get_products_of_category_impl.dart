import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/failure.dart';
import '../data_source/local_data_source.dart/products_of_category_local.dart';
import '../data_source/remote_data_source/products_of_category_remote.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repository/repo_product_of_category.dart';

class GetProductsOfCategoryRepoImpl implements GetProductsOfCategoryRepo {
  final GetProductsOfCategoryLocalDataSourceImpl getProductsLocal;
  final GetProductsOfCategoryRemoteDataSourceImpl getProductsRemote;

  GetProductsOfCategoryRepoImpl(
      {required this.getProductsLocal, required this.getProductsRemote});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductOfCategory(
      String nameCategory) async {
    //===== get from local =====
    final box = await getProductsLocal.openBox();
    final productsLocal = getProductsLocal.getProducts(box);

    // Filter products based on the requested category
    final filteredProducts = productsLocal
        .where((product) => product.categoryProduct == nameCategory)
        .toList();

    if (filteredProducts.isNotEmpty) {
      return right(filteredProducts);
    }

    try {
      //===== get from remote =====
      final productsRemote =
          await getProductsRemote.getProductsOfCategory(nameCategory);
      return right(productsRemote);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
