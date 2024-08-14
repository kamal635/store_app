import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../feautres/products/presentation/widgets/home/section_form_field_and_title.dart';
import '../color/app_color.dart';
import '../function/check_local_arabic.dart';

class CustomSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSliverAppBar({
    super.key,
    this.action,
    this.onPressedLeading,
    this.iconLeading,
    this.isLeading = false,
  });
  final Widget? action;

  final Function()? onPressedLeading;
  final IconData? iconLeading;
  final bool isLeading;
  @override
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: isLeading
          ? Padding(
              padding: EdgeInsets.only(
                left: isArabicLocale() ? 0 : 15.h,
                right: isArabicLocale() ? 15.h : 0,
                bottom: 5.h,
              ),
              child: CircleAvatar(
                backgroundColor: AppColor.background,
                child: IconButton(
                  onPressed: onPressedLeading,
                  icon: FaIcon(
                    iconLeading,
                    size: 15.h,
                    color: AppColor.blacK,
                  ),
                ),
              ),
            )
          : null,
      actions: [
        Padding(
          padding: EdgeInsets.only(
              left: isArabicLocale() ? 15.h : 0,
              right: isArabicLocale() ? 0 : 15.h,
              bottom: 5.h),
          child: action,
        ),
      ],
      pinned: true,
      floating: true,
      expandedHeight: 180.h,
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: 30.h),
        decoration: BoxDecoration(gradient: AppColor.linearGradient()),
        child: const FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: SectionTitleWithFormField(),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
