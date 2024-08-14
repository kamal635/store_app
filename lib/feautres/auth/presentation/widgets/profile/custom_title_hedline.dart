import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/color/app_color.dart';
import 'package:store_app/core/fonts/app_font.dart';
import 'package:store_app/core/function/check_local_arabic.dart';

class CustomTitleHeadlines extends StatelessWidget {
  const CustomTitleHeadlines(
      {super.key, required this.titleHedline, this.onPressedIcon});
  final String titleHedline;
  final Function()? onPressedIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          isArabicLocale() ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: isArabicLocale() ? 0 : 20.h,
          right: isArabicLocale() ? 20.h : 0),
      height: 30.h,
      width: double.infinity,
      color: AppColor.lightGrey,
      child: Text(
        titleHedline,
        style: AppFonts.bold_16,
      ),
    );
  }
}
