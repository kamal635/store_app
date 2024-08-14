import 'package:hive/hive.dart';
import '../../../../core/classes/hive_const.dart';
import '../../../products/domain/entities/product_entity.dart';

abstract class CartLocalDataSource {
  Future<Box> openBox();
  Future<void> addToCart(Box box, ProductEntity productEntity);
  Future<void> removeFromCart(Box box, ProductEntity productEntity);

  Future<void> clearAllCart(Box box);
  List<ProductEntity> getAllCartProduct(Box box);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox(AppHive.cart);
    return box;
  }

  @override
  Future<void> addToCart(Box box, ProductEntity productEntity) async {
    await box.put(productEntity.idProduct, productEntity);
  }

  @override
  Future<void> removeFromCart(Box box, ProductEntity productEntity) async {
    await box.delete(productEntity.idProduct);
  }

  @override
  Future<void> clearAllCart(Box box) async {
    await box.clear();
  }

  @override
  List<ProductEntity> getAllCartProduct(Box box) {
    return box.values.toList().cast<ProductEntity>();
  }
}
