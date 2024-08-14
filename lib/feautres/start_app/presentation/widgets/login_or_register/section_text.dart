import 'package:flutter/material.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';

class SectionTextLoginOrRegister extends StatelessWidget {
  const SectionTextLoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Ecommerce\n",
              style: AppFonts.bold_40.copyWith(
                color: AppColor.white,
              ),
            ),
            TextSpan(
              text: "Store",
              style: AppFonts.bold_40.copyWith(
                color: AppColor.jGDark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
