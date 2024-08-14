import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/classes/icons.dart';
import '../../../../../core/color/app_color.dart';

class SectionCircleAvatarChangePasswordNote extends StatelessWidget {
  const SectionCircleAvatarChangePasswordNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColor.white.withAlpha(160),
          radius: 80.h,
        ),
        CircleAvatar(
          backgroundColor: AppColor.grey.withAlpha(160),
          radius: 70.h,
        ),
        CircleAvatar(
          backgroundColor: AppColor.darkTheme.withAlpha(140),
          radius: 60.h,
        ),
        Icon(
          AppIcon.email,
          color: AppColor.white,
          size: 70.h,
        ),
      ],
    );
  }
}
