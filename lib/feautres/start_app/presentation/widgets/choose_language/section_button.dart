import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../../../core/classes/image_assets.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/widgets/custom_elvated_button.dart';
import '../../../../localization/domain/enum_locale.dart';
import '../../../../localization/presntation/locale_bloc/locale_bloc.dart';
import '../../../data/local_data_source/save_start_app.dart';

class SectionButtonLanguage extends StatelessWidget {
  const SectionButtonLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: AppColor.linearGradient(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: BlocBuilder<AppLocaleBloc, AppLocaleState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Select Language",
                style: AppFonts.bold_18.copyWith(color: AppColor.white),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100.h,
                height: 40.h,
                child: CustomElvatedButton(
                  backgroundColor: AppColor.darkGrey,
                  imageAction: AppAssets.flagUsa,
                  isAction: true,
                  onPressed: () async {
                    BlocProvider.of<AppLocaleBloc>(context).add(
                        const ChangeLocaleEvent(
                            appLanguage: AppLocale.english));
                    Box box = await SaveStartViewAppLocal.openBox();
                    await SaveStartViewAppLocal.chooseLanguage(box);
                    if (!context.mounted) return;
                    context.replace(AppRouter.onBordingView);
                  },
                  titleAction: "ENGLISH",
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100.h,
                height: 40.h,
                child: CustomElvatedButton(
                  backgroundColor: AppColor.darkGrey,
                  imageAction: AppAssets.flagSyria,
                  isAction: true,
                  onPressed: () async {
                    BlocProvider.of<AppLocaleBloc>(context).add(
                        const ChangeLocaleEvent(appLanguage: AppLocale.arabic));
                    Box box = await SaveStartViewAppLocal.openBox();
                    await SaveStartViewAppLocal.chooseLanguage(box);
                    if (!context.mounted) return;
                    context.replace(AppRouter.onBordingView);
                  },
                  titleAction: "ARABIC",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
