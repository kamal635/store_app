import 'package:flutter/material.dart';
import '../../../../../core/fonts/app_font.dart';

class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth(
      {super.key,
      required this.textSpan1,
      required this.textSpan2,
      this.fontSpan1,
      this.fontSpan2});
  final String textSpan1;
  final String textSpan2;
  final TextStyle? fontSpan1;
  final TextStyle? fontSpan2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: textSpan1,
              style:
                  fontSpan1 ?? AppFonts.bold_25.copyWith(fontFamily: "Cairo")),
          TextSpan(
              text: textSpan2,
              style: fontSpan2 ??
                  AppFonts.regular_25.copyWith(fontFamily: "Cairo")),
        ],
      ),
    );
  }
}
