import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../entities/product_entity.dart';

abstract class GetProductsOfCategoryRepo {
  Future<Either<Failure, List<ProductEntity>>> getProductOfCategory(
      String nameCategory);
}
