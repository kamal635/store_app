import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../data/local_data_source/locale_local_data_source.dart';
import '../../domain/enum_locale.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class AppLocaleBloc extends Bloc<AppLocalEvent, AppLocaleState> {
  final LocaleLocalDataSourceImpl localeLocalDataSourceImpl;
  AppLocaleBloc({required this.localeLocalDataSourceImpl})
      : super(LocaleInitial()) {
    on<AppLocalEvent>((event, emit) async {
      //================== current locale event =========================
      if (event is CurrentLocaleEvent) {
        Box box = await localeLocalDataSourceImpl.openBox();
        final locale = await localeLocalDataSourceImpl.getLocale(box);
        emit(ChangeLocaleState(locale: language[locale]!));

        //================== change locale event =========================
      } else if (event is ChangeLocaleEvent) {
        Box box = await localeLocalDataSourceImpl.openBox();
        await localeLocalDataSourceImpl.addLocale(box, event.appLanguage);
        emit(ChangeLocaleState(locale: language[event.appLanguage]!));
      }
    });
  }
}
