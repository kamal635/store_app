import 'package:flutter/material.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../../../generated/l10n.dart';

class SectionTitleChangePasswordNote extends StatelessWidget {
  const SectionTitleChangePasswordNote({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: S.of(context).sendEmail,
              style: AppFonts.bold_25.copyWith(fontFamily: "Cairo")),
          TextSpan(
              text: S.of(context).changeSuccess,
              style: AppFonts.regular_13.copyWith(fontFamily: "Cairo")),
        ],
      ),
    );
  }
}
