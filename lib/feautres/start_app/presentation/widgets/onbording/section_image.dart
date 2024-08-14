import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/function/check_local_arabic.dart';

class SectionImageOnBording extends StatelessWidget {
  const SectionImageOnBording(
      {super.key, required this.heightContainer, required this.image});
  final double heightContainer;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightContainer,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.h),
          topRight: Radius.circular(30.h),
          bottomLeft:
              isArabicLocale() ? Radius.circular(120.h) : Radius.circular(30.h),
          bottomRight:
              isArabicLocale() ? Radius.circular(30.h) : Radius.circular(120.h),
        ),
      ),
    );
  }
}
