import 'package:hive/hive.dart';

import '../../../../core/classes/hive_const.dart';
import '../../../products/domain/entities/product_entity.dart';

abstract class FavoriteLocalDataSource {
  Future<Box> openBox();
  Future<void> addProduct(Box box, ProductEntity productEntity);
  Future<void> removeProduct(Box box, ProductEntity productEntity);
  Future<void> removeAllProduct(Box box);
  List<ProductEntity> getProducts(Box box);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox(AppHive.favorite);
    return box;
  }

  @override
  Future<void> addProduct(Box box, ProductEntity productEntity) async {
    await box.put(productEntity.idProduct, productEntity);
  }

  @override
  Future<void> removeProduct(Box box, ProductEntity productEntity) async {
    await box.delete(productEntity.idProduct);
  }

  @override
  Future<void> removeAllProduct(Box box) async {
    await box.clear();
  }

  @override
  List<ProductEntity> getProducts(Box box) {
    return box.values.toList().cast<ProductEntity>();
  }
}
