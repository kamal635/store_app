import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/widgets/custom_elvated_button.dart';
import '../../../../auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';
import '../../../data/local_data_source/save_start_app.dart';
import '../../../../../generated/l10n.dart';

class SectionButtonLoginOrRegister extends StatelessWidget {
  const SectionButtonLoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 100.h,
          height: 35.h,
          child: BlocBuilder<AuthListenBloc, AuthListenState>(
            builder: (context, state) {
              return CustomElvatedButton(
                onPressed: () async {
                  BlocProvider.of<AuthListenBloc>(context)
                      .add(const AuthUserChanged());
                  Box box = await SaveStartViewAppLocal.openBox();
                  await SaveStartViewAppLocal.loginOrRegister(box);
                  if (!context.mounted) return;
                  context.replace(AppRouter.login);
                },
                title: S.of(context).loginOrRegister,
              );
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width - 100.h,
        //   child: OutlinedButton(
        //     style: OutlinedButton.styleFrom(
        //       side: BorderSide(width: 2.h, color: AppColor.jGDark),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30.r),
        //       ),
        //     ),
        //     onPressed: () async {
        //       Box box = await SaveStartViewAppLocal.openBox();
        //       await SaveStartViewAppLocal.loginOrRegister(box);
        //       if (!context.mounted) return;
        //       context.replace(AppRouter.homeView);
        //     },
        //     child: Text(
        //       S.of(context).guest,
        //       style: AppFonts.semiBold_16.copyWith(color: AppColor.white),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
