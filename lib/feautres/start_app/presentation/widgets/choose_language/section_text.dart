import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';

class SectionTextChooseLanguage extends StatelessWidget {
  const SectionTextChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: "WELCOME\n",
                style: AppFonts.bold_30.copyWith(color: AppColor.white),
              ),
              TextSpan(
                text: "Let's Get Started",
                style: AppFonts.bold_18.copyWith(color: AppColor.jGLight),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// ListTile(
//         title: Text(
//           ,
//         
//         ),
//         subtitle: Text(
//           "Let's Get Started",
//           style: AppFonts.semiBold_14.copyWith(color: AppColor.lightGrey),
//         ),
//       )