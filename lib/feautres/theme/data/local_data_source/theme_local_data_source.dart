import 'package:hive/hive.dart';
import '../../domain/model/theme.dart';
import '../../../../core/classes/hive_const.dart';

abstract class ThemeLocalDataSource {
  Future<Box> openBox();
  Future<void> addTheme(Box box, AppTheme appTheme);
  Future<AppTheme> getTheme(Box box);
}

class ThemeLocalDataSourceImpl extends ThemeLocalDataSource {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox(AppHive.theme);
    return box;
  }

  @override
  Future<void> addTheme(Box box, AppTheme appTheme) async {
    await box.put(AppHive.theme, appTheme);
  }

  @override
  Future<AppTheme> getTheme(Box box) async {
    final theme = box.get(AppHive.theme);
    if (theme == null) {
      return AppTheme.light;
    } else {
      return theme;
    }
  }
}
