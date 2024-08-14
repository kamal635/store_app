import 'package:hive/hive.dart';
import '../../../../core/classes/hive_const.dart';

class SaveStartViewAppLocal {
  static Future<Box> openBox() async {
    Box box = await Hive.openBox(AppHive.startApp);
    return box;
  }

  static Future<void> loginOrRegister(Box box) async {
    await box.put(AppHive.loginOrRegister, true);
  }

  static Future<void> chooseLanguage(Box box) async {
    await box.put(AppHive.chooseLanguage, true);
  }

  static Future<void> onBording(Box box) async {
    await box.put(AppHive.onBording, true);
  }

  static bool getLoginOrRegister(Box box) {
    return box.get(AppHive.loginOrRegister) ?? false;
  }

  static bool getChooseLanguage(Box box) {
    return box.get(AppHive.chooseLanguage) ?? false;
  }

  static bool getOnBording(Box box) {
    return box.get(AppHive.onBording) ?? false;
  }
}
