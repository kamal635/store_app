import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

part 'enum_locale.g.dart';

@HiveType(typeId: 3)
enum AppLocale {
  @HiveField(0)
  arabic("Arabic"),
  @HiveField(1)
  english("English");

  const AppLocale(this.name);
  final String name;
}

Map<AppLocale, Locale> language = {
  AppLocale.arabic: const Locale("ar"),
  AppLocale.english: const Locale("en"),
};
