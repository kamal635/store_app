import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../classes/icon_category.dart';
import '../color/app_color.dart';
import '../function/check_local_arabic.dart';

class ShimmerLoadingCategory extends StatelessWidget {
  const ShimmerLoadingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 90.h,
            child: Shimmer.fromColors(
              baseColor: Colors.black12,
              highlightColor: Colors.white,
              child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: AppCategoryIcon.categoryListIcon.length,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: isArabicLocale() ? 0 : 40.w,
                            left: isArabicLocale() ? 40.w : 0,
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColor.grey,
                                ),
                                height: 48.h,
                                width: 48.h,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColor.grey,
                                ),
                                height: 10.h,
                                width: 48.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ))
      ],
    );
  }
}
