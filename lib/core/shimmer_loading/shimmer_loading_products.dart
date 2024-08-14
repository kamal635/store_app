import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../function/check_local_arabic.dart';
import '../color/app_color.dart';

class ShimmerLoadingProducts extends StatelessWidget {
  const ShimmerLoadingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 220.h,
            child: Shimmer.fromColors(
              baseColor: Colors.black12,
              highlightColor: Colors.white,
              child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: isArabicLocale() ? 0 : 20.w,
                                left: isArabicLocale() ? 20.w : 0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColor.grey,
                              ),
                              width: 155.h,
                              height: 210.h,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ))
      ],
    );
  }
}
