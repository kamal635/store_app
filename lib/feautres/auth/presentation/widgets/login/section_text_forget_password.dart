import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../generated/l10n.dart';

class SectionTextForgetPassword extends StatelessWidget {
  const SectionTextForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.push(AppRouter.forgetPassword);
        },
        child: Text(
          S.of(context).forgetPassword,
          style: AppFonts.bold_13.copyWith(
            color: AppColor.white,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
