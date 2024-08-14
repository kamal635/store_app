import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dialog_langage_and_theme.dart';
import '../../../../data/data_source/local_data_source.dart/save_check_dark_or_light_mode.dart';
import '../../../../../theme/domain/model/theme.dart';
import '../../../../../theme/presentation/bloc/theme_app/theme_app_bloc.dart';
import '../../../../../../generated/l10n.dart';

Future<void> methodChooseTheme(BuildContext context) async {
  return await customLanguageAndTheme(
      isLight: CheckDarkOrLightMode.getMode(),
      titleChoose1: S.of(context).darkMode,
      titleChoose2: S.of(context).lightMode,
      context: context,
      onPressedChoose1: () async {
        if (CheckDarkOrLightMode.getMode() == false) {
          BlocProvider.of<AppThemeBloc>(context)
              .add(const ChangeThemeEvent(changeTheme: AppTheme.dark));
          await CheckDarkOrLightMode.putMode();
        }
        if (!context.mounted) return;
        context.pop();
      },
      onPressedChoose2: () async {
        if (CheckDarkOrLightMode.getMode() == true) {
          BlocProvider.of<AppThemeBloc>(context)
              .add(const ChangeThemeEvent(changeTheme: AppTheme.light));
          await CheckDarkOrLightMode.deleteMode();
        }
        if (!context.mounted) return;
        context.pop();
      },
      title: "Choose Theme");
}
