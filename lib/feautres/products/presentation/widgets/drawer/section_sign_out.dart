import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/classes/icons.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../../../core/function/toast_flutter.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../auth/presentation/bloc/auth_bloc/sign_out/sign_out_bloc.dart';
import '../../../../../generated/l10n.dart';

class SectionSignOut extends StatelessWidget {
  const SectionSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<SignOutBloc, SignOutState>(
          listener: (context, state) {
            if (state is SignOutFailure) {
              toast(message: state.errorMessage, color: AppColor.erorr);
            }
            if (state is SignOutSuccess) {
              context.replace(AppRouter.login);
            }
          },
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                BlocProvider.of<SignOutBloc>(context).add(SignOutTappedEvent());
              },
              icon: const Icon(
                AppIcon.signOut,
                color: AppColor.blacK,
              ),
            );
          },
        ),
        SizedBox(
          width: 40.h,
        ),
        Text(
          S.of(context).signOut,
          style: AppFonts.bold_16.copyWith(color: AppColor.background),
        )
      ],
    );
  }
}
