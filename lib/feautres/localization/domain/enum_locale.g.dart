// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_locale.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppLanguageAdapter extends TypeAdapter<AppLocale> {
  @override
  final int typeId = 3;

  @override
  AppLocale read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppLocale.arabic;
      case 1:
        return AppLocale.english;
      default:
        return AppLocale.arabic;
    }
  }

  @override
  void write(BinaryWriter writer, AppLocale obj) {
    switch (obj) {
      case AppLocale.arabic:
        writer.writeByte(0);
        break;
      case AppLocale.english:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
