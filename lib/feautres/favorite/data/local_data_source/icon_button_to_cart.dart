import 'package:hive/hive.dart';

import '../../../../core/classes/hive_const.dart';
import '../../../products/domain/entities/product_entity.dart';

class AddToCartButtonSaveLocal {
  static Future<void> addButton(ProductEntity productEntity) async {
    await Hive.box(AppHive.addToCartButton).put(productEntity.idProduct, true);
  }

  static Future<void> removeButton(ProductEntity productEntity) async {
    await Hive.box(AppHive.addToCartButton).delete(productEntity.idProduct);
  }

  static Future<void> clearAllAdd() async {
    await Hive.box(AppHive.addToCartButton).clear();
  }

  static bool getButton(ProductEntity productEntity) {
    return Hive.box(AppHive.addToCartButton).get(productEntity.idProduct) ??
        false;
  }
}
