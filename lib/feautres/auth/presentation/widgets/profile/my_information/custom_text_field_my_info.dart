import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/color/app_color.dart';
import 'package:store_app/core/fonts/app_font.dart';
import 'package:store_app/core/function/check_local_arabic.dart';

class CustomTextFieldMyInfo extends StatelessWidget {
  const CustomTextFieldMyInfo({
    super.key,
    required this.titleLable,
    this.onChanged,
    this.controller,
    this.readOnly = false,
  });
  final String titleLable;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Material(
        elevation: 3,
        shadowColor: AppColor.grey,
        child: TextFormField(
          readOnly: readOnly,
          controller: controller,
          onChanged: onChanged,
          style: AppFonts.semiBold_14.copyWith(color: AppColor.blacK),
          maxLines: null,
          cursorColor: AppColor.jGDark,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: 15.h,
                left: isArabicLocale() ? 0 : 10.h,
                right: isArabicLocale() ? 10.h : 0),
            label: Text(
              titleLable,
            ),
            labelStyle: AppFonts.semiBold_14.copyWith(color: AppColor.grey),
            filled: true,
            fillColor: AppColor.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6.h))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6.h))),
          ),
        ),
      ),
    );
  }
}
