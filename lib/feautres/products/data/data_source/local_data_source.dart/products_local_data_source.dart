import 'package:hive/hive.dart';
import '../../../../../core/classes/hive_const.dart';

import '../../../domain/entities/product_entity.dart';

abstract class AllProductsLocalDataSource {
  Future<Box> openBox();
  Future<void> addAllProducts(Box box, List<ProductEntity> product);
  List<ProductEntity> getAllProducts(Box box);
}

class AllProductsLocalDataSourceImpl implements AllProductsLocalDataSource {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox(AppHive.productsBox);
    return box;
  }

  @override
  Future<void> addAllProducts(Box box, List<ProductEntity> product) async {
    await box.addAll(product);
  }

  @override
  List<ProductEntity> getAllProducts(Box box) {
    return box.values.toList().cast<ProductEntity>();
  }
}
