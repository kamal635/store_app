import 'package:hive/hive.dart';
import '../../../../../core/classes/hive_const.dart';

class CheckDarkOrLightMode {
  static Future<void> putMode() async {
    await Hive.box(AppHive.checkLightOrDark)
        .put(AppHive.checkLightOrDark, true);
  }

  static Future<void> deleteMode() async {
    await Hive.box(AppHive.checkLightOrDark).delete(AppHive.checkLightOrDark);
  }

  static bool getMode() {
    return Hive.box(AppHive.checkLightOrDark).get(AppHive.checkLightOrDark) ??
        false;
  }
}
