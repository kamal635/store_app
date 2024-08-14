import 'package:dartz/dartz.dart';

import '../../../../core/use_case/no_param_use_case.dart';
import '../../../../core/utils/failure.dart';
import '../entities/category_entity.dart';
import '../repository/repo_category.dart';

class GetCategoryUseCases extends UseCaseNoParam {
  final CategoryRepo getCategoryRepo;
  GetCategoryUseCases({required this.getCategoryRepo});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await getCategoryRepo.get();
  }
}
