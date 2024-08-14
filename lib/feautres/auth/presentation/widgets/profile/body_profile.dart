import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/feautres/auth/presentation/widgets/profile/section_button_edit_profile.dart';
import 'package:store_app/feautres/auth/presentation/widgets/profile/section_content_info.dart';
import 'package:store_app/feautres/auth/presentation/widgets/profile/section_image_profile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const SectionImageProfileView(),
              const SectionButtonEditProfile(),
              SizedBox(
                height: 30.h,
              ),
              const SectionContentInfoProflieView()
            ],
          ),
        )
      ],
    );
  }
}
