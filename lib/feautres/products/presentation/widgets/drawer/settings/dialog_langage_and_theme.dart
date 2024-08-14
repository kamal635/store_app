import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/classes/icons.dart';
import '../../../../../../core/color/app_color.dart';
import '../../../../../../core/fonts/app_font.dart';

Future<void> customLanguageAndTheme({
  required BuildContext context,
  required Function()? onPressedChoose1,
  required Function()? onPressedChoose2,
  required String title,
  required String titleChoose1,
  required String titleChoose2,
  bool isEnglish = true,
  bool isLight = true,
}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.bold_18.copyWith(color: AppColor.jGDark),
          ),
          content: SizedBox(
            height: 75.h,
            child: Column(
              children: [
                InkWell(
                  onTap: onPressedChoose1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        titleChoose1,
                        style: AppFonts.semiBold_14,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            AppIcon.circle,
                            size: 22.h,
                          ),
                          isEnglish && isLight
                              ? CircleAvatar(
                                  radius: 4.h,
                                  backgroundColor: AppColor.blacK,
                                )
                              : const SizedBox()
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: onPressedChoose2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        titleChoose2,
                        style: AppFonts.semiBold_14,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            AppIcon.circle,
                            size: 22.h,
                          ),
                          isEnglish && isLight
                              ? const SizedBox()
                              : CircleAvatar(
                                  radius: 4.h,
                                  backgroundColor: AppColor.blacK,
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
