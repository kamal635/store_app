import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/function/check_local_arabic.dart';
import '../../../../../core/color/app_color.dart';

import '../../../domain/entities/product_entity.dart';

class SectionListImages extends StatelessWidget {
  const SectionListImages({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: productEntity.subImage.length,
        itemBuilder: ((context, i) {
          return Padding(
            padding: EdgeInsets.only(
              right: isArabicLocale() ? 0 : 10.h,
              left: isArabicLocale() ? 10.h : 0,
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.h),
                  border: Border.all(width: 1, color: AppColor.grey)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.h),
                child: CachedNetworkImage(
                  imageUrl: productEntity.subImage[i],
                  fadeInCurve: Curves.easeIn,
                  fit: BoxFit.fill,
                  width: 100.h,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
