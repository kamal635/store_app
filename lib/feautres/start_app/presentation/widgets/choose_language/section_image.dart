import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/classes/image_assets.dart';
import '../../../../../core/color/app_color.dart';

class SectionImageChooseLanguage extends StatelessWidget {
  const SectionImageChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 100.h),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            AppAssets.chooseLanguage,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: AppColor.blacK.withAlpha(75),
        )
      ],
    );
  }
}
