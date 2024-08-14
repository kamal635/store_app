import 'package:hive/hive.dart';
import '../../../../../core/classes/hive_const.dart';
import '../../../domain/entities/product_entity.dart';

abstract class GetProductsOfCategoryLocalDataSource {
  Future<Box> openBox();
  Future<void> addProducts(Box box, List<ProductEntity> productEntity);
  List<ProductEntity> getProducts(Box box);
}

class GetProductsOfCategoryLocalDataSourceImpl
    implements GetProductsOfCategoryLocalDataSource {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox(AppHive.getProductsOfCategory);
    return box;
  }

  @override
  Future<void> addProducts(Box box, List<ProductEntity> productEntity) async {
    await box.addAll(productEntity);
  }

  @override
  List<ProductEntity> getProducts(Box box) {
    return box.values.toList().cast<ProductEntity>();
  }
}
