import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../feautres/localization/domain/enum_locale.dart';
import '../../feautres/products/domain/entities/category_entity.dart';
import '../../feautres/products/domain/entities/product_entity.dart';
import '../../feautres/theme/domain/model/theme.dart';
import '../classes/hive_const.dart';
import '../utils/bloc_obeserver.dart';
import '../utils/dependency_injection.dart';

Future<void> initFlutter() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    initGetIt(),
    Hive.initFlutter(),
    Firebase.initializeApp(),
  ]);

  await Hive.openBox(AppHive.quantity);
  await Hive.openBox(AppHive.addToCartButton);
  await Hive.openBox(AppHive.iconFavorite);
  await Hive.openBox(AppHive.checkLanguage);
  await Hive.openBox(AppHive.checkLightOrDark);

  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter<CategoryEntity>(CategoryEntityAdapter());
  Hive.registerAdapter<ProductEntity>(ProductEntityAdapter());
  Hive.registerAdapter<AppTheme>(AppThemeAdapter());
  Hive.registerAdapter<AppLocale>(AppLanguageAdapter());
}
