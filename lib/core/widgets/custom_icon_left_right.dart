import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../classes/image_assets.dart';
import '../color/app_color.dart';
import '../function/check_local_arabic.dart';

class CustomIconLeftOrRight extends StatelessWidget {
  const CustomIconLeftOrRight(
      {super.key,
      this.onPressed,
      this.colorCircleAvatar,
      this.colorImage,
      this.heightIcon,
      required this.isAppbar,
      this.isCircleOnLeading = false});
  final Function()? onPressed;
  final Color? colorCircleAvatar;
  final Color? colorImage;
  final double? heightIcon;
  final bool isAppbar;
  final bool isCircleOnLeading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: isCircleOnLeading
          ? CircleAvatar(
              backgroundColor: colorCircleAvatar ?? AppColor.jGLight,
              radius: 25.h,
              child: Image.asset(
                isArabicLocale()
                    ? (isAppbar ? AppAssets.iconRight : AppAssets.iconLeft)
                    : (isAppbar ? AppAssets.iconLeft : AppAssets.iconRight),
                height: heightIcon ?? 13.h,
                color: colorImage ?? AppColor.white,
              ),
            )
          : CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25.h,
              child: Image.asset(
                isArabicLocale()
                    ? (isAppbar ? AppAssets.iconRight : AppAssets.iconLeft)
                    : (isAppbar ? AppAssets.iconLeft : AppAssets.iconRight),
                height: heightIcon ?? 13.h,
                color: colorImage ?? AppColor.white,
              ),
            ),
    );
  }
}
