import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/classes/icons.dart';
import 'package:store_app/core/color/app_color.dart';
import 'package:store_app/core/fonts/app_font.dart';
import 'package:store_app/core/function/check_local_arabic.dart';

class CustomBodyHedline extends StatelessWidget {
  const CustomBodyHedline(
      {super.key, required this.titleBodyHedline, this.onPressed});
  final String titleBodyHedline;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: isArabicLocale() ? 0 : 20.h,
          right: isArabicLocale() ? 20.h : 0),
      height: 30.h,
      width: double.infinity,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleBodyHedline,
              style: AppFonts.semiBold_14.copyWith(color: AppColor.darkGrey),
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                isArabicLocale() ? AppIcon.angleLeft : AppIcon.angleRight,
                size: 16.h,
                color: AppColor.jGDark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
