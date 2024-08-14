import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/function/check_local_arabic.dart';
import 'section_image_with_info_user.dart';
import 'section_items_body.dart';
import 'section_sign_out.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    double widthDrawer = MediaQuery.of(context).size.width / 1.2;
    double widthNameWithEmail = widthDrawer - 110.h;
    return SizedBox(
      width: widthDrawer,
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.erorr, gradient: AppColor.linearGradient()),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  children: [
                    // SectionCircleAvatar(isDarkTheme: isDarkTheme),
                    Padding(
                      padding: EdgeInsets.only(
                          left: isArabicLocale() ? 0 : 20.h,
                          right: isArabicLocale() ? 20.h : 0,
                          top: 50.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionImageWithInfoUser(
                              widthNameWithEmail: widthNameWithEmail),
                          SizedBox(
                            height: 60.h,
                          ),
                          SectionItemsBody(widthDrawer: widthNameWithEmail),
                          const Spacer(),
                          const SectionSignOut(),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
