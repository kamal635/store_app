import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../color/app_color.dart';
import '../fonts/app_font.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton(
      {super.key,
      required this.onPressed,
      this.title,
      this.titleAction,
      this.imageAction,
      this.isAction = false,
      this.fontTitle,
      this.backgroundColor,
      this.isAddToCart = false,
      this.colorTitle,
      this.isRadius = true,
      this.isTitle = true});
  final void Function()? onPressed;
  final String? title;
  final String? titleAction;
  final String? imageAction;
  final bool isAction;
  final TextStyle? fontTitle;
  final Color? backgroundColor;
  final Color? colorTitle;
  final bool isAddToCart;
  final bool isRadius;
  final bool isTitle;
  @override
  Widget build(BuildContext context) {
    return isAddToCart
        ? ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColor.jGDark,
              shape: RoundedRectangleBorder(
                  borderRadius: isRadius
                      ? BorderRadius.circular(30.r)
                      : BorderRadius.circular(6.r)),
            ),
            child: Text(
              S.of(context).added,
              style: fontTitle ??
                  AppFonts.semiBold_16.copyWith(color: AppColor.white),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              backgroundColor: backgroundColor ?? AppColor.jGDark,
              shape: RoundedRectangleBorder(
                  borderRadius: isRadius
                      ? BorderRadius.circular(30.r)
                      : BorderRadius.circular(6.r)),
            ),
            child: isAction
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        titleAction ?? "",
                        style: AppFonts.semiBold_16
                            .copyWith(color: AppColor.white),
                      ),
                      CircleAvatar(
                        radius: 15.h,
                        foregroundImage: AssetImage(
                          imageAction!,
                        ),
                      ),
                    ],
                  )
                : isTitle
                    ? Text(
                        title ?? "",
                        style: fontTitle ??
                            AppFonts.semiBold_16
                                .copyWith(color: colorTitle ?? AppColor.white),
                      )
                    : const CircularProgressIndicator(),
          );
  }
}
