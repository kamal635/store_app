import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/classes/icons.dart';
import '../../../../../../core/function/check_local_arabic.dart';
import '../../../../../localization/presntation/locale_bloc/locale_bloc.dart';
import 'custom_button_settings.dart';
import 'method_change_language.dart';
import 'method_change_theme.dart';
import '../../../../../theme/domain/model/theme.dart';
import '../../../../../theme/presentation/bloc/theme_app/theme_app_bloc.dart';
import '../../../../../../generated/l10n.dart';

class BodySettings extends StatelessWidget {
  const BodySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
      child: Column(
        children: [
          BlocBuilder<AppLocaleBloc, AppLocaleState>(
            builder: (context, state) {
              return CustomButtonSettings(
                title: isArabicLocale()
                    ? S.of(context).arabic
                    : S.of(context).english,
                icon: AppIcon.language,
                onTap: () async {
                  await methodChooseLanguage(context);
                },
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<AppThemeBloc, AppThemeState>(
            builder: (context, state) {
              return CustomButtonSettings(
                title: (state as ChangedThemeState).changedTheme ==
                        theme[AppTheme.dark]
                    ? S.of(context).darkMode
                    : S.of(context).lightMode,
                icon: (state).changedTheme == theme[AppTheme.dark]
                    ? AppIcon.darkMode
                    : AppIcon.lightMode,
                onTap: () async {
                  await methodChooseTheme(context);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
