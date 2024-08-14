import 'package:dartz/dartz.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../../core/utils/failure.dart';
import '../entities/product_entity.dart';
import '../repository/repo_product_of_category.dart';

class GetProductsOfCategoryUseCase extends UseCaseParam {
  final GetProductsOfCategoryRepo getProductsOfCategoryRepo;

  GetProductsOfCategoryUseCase({required this.getProductsOfCategoryRepo});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(param) async {
    return await getProductsOfCategoryRepo.getProductOfCategory(param);
  }
}
