import 'package:hive/hive.dart';

import '../../../../core/classes/hive_const.dart';
import '../../../products/domain/entities/product_entity.dart';

//! the box open in main.dart in method initflutter();
class FavoriteIconSaveLocal {
  static Future<void> addColorToIcon(ProductEntity productEntity) async {
    await Hive.box(AppHive.iconFavorite).put(productEntity.idProduct, true);
  }

  static Future<void> removeColorToIcon(ProductEntity productEntity) async {
    await Hive.box(AppHive.iconFavorite).delete(productEntity.idProduct);
  }

  static Future<void> clearAllColorIcon() async {
    await Hive.box(AppHive.iconFavorite).clear();
  }

  static bool getColorIcon(ProductEntity productEntity) {
    return Hive.box(AppHive.iconFavorite).get(productEntity.idProduct) ?? false;
  }
}
