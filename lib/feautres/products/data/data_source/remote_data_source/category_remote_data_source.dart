import 'package:hive/hive.dart';

import '../../../../../core/utils/api_services.dart';
import '../../../domain/entities/category_entity.dart';
import '../local_data_source.dart/category_local_data_source.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> getCategory();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiService apiService;
  final CategoryLocalDataSourceImpl categoryLocalDataSourceImpl;
  const CategoryRemoteDataSourceImpl({
    required this.apiService,
    required this.categoryLocalDataSourceImpl,
  });

  @override
  Future<List<CategoryEntity>> getCategory() async {
    final data = await apiService.getCategory(endPoint: "products/categories");

    List<CategoryEntity> categories = _getCategoryList(data);

    //save data in hive local
    await addCategoryToLocal(categories);
    //return List of category
    return categories;
  }

  Future<void> addCategoryToLocal(List<CategoryEntity> categories) async {
    Box box = await categoryLocalDataSourceImpl.openBox();
    await categoryLocalDataSourceImpl.addCategory(box, categories);
  }

// method to parse data from list of string to list of category entity
  List<CategoryEntity> _getCategoryList(List<String> data) {
    List<CategoryEntity> categories = [];
    for (var item in data) {
      categories.add(
        CategoryEntity(categoryName: item),
      );
    }

    return categories;
  }
}
