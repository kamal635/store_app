import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../color/app_color.dart';
import '../fonts/app_font.dart';
import '../widgets/custom_elvated_button.dart';

Future<void> customDialog(
    {required BuildContext context,
    required Function()? onPressedCancel,
    required Function()? onPressedAgree,
    required String title}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: AppFonts.bold_18,
          ),
          actions: [
            SizedBox(
              width: 100.h,
              child: CustomElvatedButton(
                backgroundColor: AppColor.erorr,
                onPressed: onPressedCancel,
                title: S.of(context).cancel,
                fontTitle: AppFonts.bold_13,
              ),
            ),
            SizedBox(
              width: 100.h,
              child: CustomElvatedButton(
                backgroundColor: AppColor.jGDark,
                onPressed: onPressedAgree,
                title: S.of(context).agree,
                fontTitle: AppFonts.bold_13,
              ),
            ),
          ],
        );
      });
}
