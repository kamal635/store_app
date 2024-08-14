import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../color/app_color.dart';

class ShimmerLoadingProductsOfCategory extends StatelessWidget {
  const ShimmerLoadingProductsOfCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 40.h,
            crossAxisSpacing: 8,
            childAspectRatio: 0.54.h,
          ),
          itemCount: 5,
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColor.grey,
              ),
              width: 155.h,
              height: 210.h,
            );
          },
        ));
  }
}
