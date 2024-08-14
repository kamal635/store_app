import 'package:hive/hive.dart';
import '../../../../../core/classes/hive_const.dart';
import '../../../../../core/function/check_local_arabic.dart';

class CheckLanguageSettings {
  static Future<void> putLanguage() async {
    await Hive.box(AppHive.checkLanguage).put(AppHive.checkLanguage, true);
  }

  static Future<void> deleteLanguage() async {
    await Hive.box(AppHive.checkLanguage).delete(AppHive.checkLanguage);
  }

  static bool getLanguage() {
    if (isArabicLocale()) {
      return Hive.box(AppHive.checkLanguage).get(AppHive.checkLanguage) ?? true;
    } else {
      return false;
    }
  }
}
