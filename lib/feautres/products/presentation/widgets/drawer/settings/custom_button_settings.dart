import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/color/app_color.dart';
import '../../../../../../core/fonts/app_font.dart';

class CustomButtonSettings extends StatelessWidget {
  const CustomButtonSettings({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });
  final Function()? onTap;
  final String title;

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.jGMedium,
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        padding: EdgeInsets.all(6.h),
        height: 45.h,
        width: double.infinity,
        child: Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.white,
                  child: Icon(
                    icon,
                    size: 20.h,
                    color: AppColor.blacK,
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                Text(
                  title,
                  style: AppFonts.bold_18.copyWith(color: AppColor.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
