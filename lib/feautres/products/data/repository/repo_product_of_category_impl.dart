import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/failure.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repository/repo_product.dart';
import '../data_source/local_data_source.dart/products_local_data_source.dart';
import '../data_source/remote_data_source/all_products.dart';

class GetAllProductsRepoImpl extends AllProductsRepo {
  final AllProductsRemoteDataSourceImpl productOfCategoryRemoteDataSourceImpl;
  final AllProductsLocalDataSourceImpl productsLocalDataSourceImpl;

  GetAllProductsRepoImpl(
      {required this.productOfCategoryRemoteDataSourceImpl,
      required this.productsLocalDataSourceImpl});
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    List<ProductEntity> productsLocal = await getProductsFromLocal();
    if (productsLocal.isNotEmpty) {
      return right(productsLocal);
    }

    try {
      final productsRemote =
          await productOfCategoryRemoteDataSourceImpl.getAllProducts();

      return right(productsRemote);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  Future<List<ProductEntity>> getProductsFromLocal() async {
    Box box = await productsLocalDataSourceImpl.openBox();
    final products = productsLocalDataSourceImpl.getAllProducts(box);
    return products;
  }
}
