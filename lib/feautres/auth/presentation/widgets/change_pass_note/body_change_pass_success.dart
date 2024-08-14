import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color/app_color.dart';
import 'section_button.dart';
import 'section_circle_avatar.dart';
import 'section_title.dart';

class NoteChangePasswordViewBody extends StatelessWidget {
  const NoteChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: AppColor.linearGradient()),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // section circle avatar
                  const SectionCircleAvatarChangePasswordNote(),

                  SizedBox(
                    height: 30.h,
                  ),

                  // section title
                  const SectionTitleChangePasswordNote(),

                  SizedBox(
                    height: 30.h,
                  ),

                  // section buuton
                  const SectionButtonChangePasswordNote()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
