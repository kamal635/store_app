import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/classes/icons.dart';
import 'package:store_app/core/color/app_color.dart';
import 'package:store_app/feautres/auth/presentation/widgets/profile/my_information/section_button_my_info.dart';
import 'package:store_app/feautres/auth/presentation/widgets/profile/my_information/section_text_field_my_info.dart';

class MyInformationViewBody extends StatelessWidget {
  const MyInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              children: [
                Icon(
                  AppIcon.userEdit,
                  size: 100.h,
                  color: AppColor.jGDark,
                ),
                SizedBox(
                  height: 40.h,
                ),
                const SectionTextFieldMyInfo(),
                const SectionButtonMyInfo(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
