import 'package:dartz/dartz.dart';
import '../../../../core/use_case/no_param_use_case.dart';
import '../../../../core/utils/failure.dart';
import '../entities/product_entity.dart';

import '../repository/repo_product.dart';

class AllProductsUseCase extends UseCaseNoParam {
  final AllProductsRepo getProductsOfCategoryRepo;
  AllProductsUseCase({required this.getProductsOfCategoryRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await getProductsOfCategoryRepo.getAllProducts();
  }
}
