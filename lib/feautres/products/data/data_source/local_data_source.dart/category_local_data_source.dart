import 'package:hive/hive.dart';

import '../../../../../core/classes/hive_const.dart';
import '../../../domain/entities/category_entity.dart';

abstract class CategoryLocalDataSource {
  Future<Box> openBox();
  Future<void> addCategory(Box box, List<CategoryEntity> categoryEntity);
  Future<List<CategoryEntity>> getCategory(Box box);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<CategoryEntity>(AppHive.categoryBox);
    return box;
  }

  @override
  Future<void> addCategory(Box box, List<CategoryEntity> categoryEntity) async {
    await box.addAll(categoryEntity);
  }

  @override
  Future<List<CategoryEntity>> getCategory(Box box) async {
    return box.values.toList().cast();
  }
}
