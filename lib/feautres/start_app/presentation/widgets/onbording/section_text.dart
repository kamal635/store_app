import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color/app_color.dart';

import '../../../../../core/fonts/app_font.dart';

class SectionText extends StatelessWidget {
  const SectionText(
      {super.key,
      required this.heightContainer,
      required this.title1,
      required this.title2,
      required this.subtitle});
  final double heightContainer;
  final String title1;
  final String title2;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: title1,
                  style: AppFonts.bold_25.copyWith(color: AppColor.jGLight)),
              TextSpan(
                  text: title2,
                  style: AppFonts.bold_25
                      .copyWith(color: AppColor.darkGrey, height: 1.5.h)),
            ],
          ),
        ),
        SizedBox(
          height: heightContainer / 10,
        ),
        Text(
          subtitle,
          style: AppFonts.regular_13.copyWith(color: AppColor.blacK),
        )
      ],
    );
  }
}
