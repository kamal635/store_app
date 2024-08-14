import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';

import '../entities/product_entity.dart';

abstract class AllProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
