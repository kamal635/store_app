import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../color/app_color.dart';
import '../fonts/app_font.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.onPressedPrefixIcon,
    this.fillColor,
    this.onChanged,
    this.focusNode,
    this.isRaiusEnabled = true,
    this.isRaiusfocused = true,
    this.colorIcon,
    this.suffixIcon,
    this.onPressedSuffixIcon,
    this.errorText,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.hintColor,
  });
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onPressedPrefixIcon;
  final void Function()? onPressedSuffixIcon;
  final void Function(String)? onChanged;
  final Color? colorIcon;
  final Color? hintColor;
  final FocusNode? focusNode;
  final bool isRaiusEnabled;
  final bool obscureText;
  final bool isRaiusfocused;
  final Color? fillColor;
  final String? errorText;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 10.w,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        style: AppFonts.semiBold_14.copyWith(color: AppColor.blacK),
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        onChanged: onChanged,
        cursorColor: AppColor.white,
        decoration: InputDecoration(
          errorText: errorText,
          suffixIcon: IconButton(
            onPressed: onPressedSuffixIcon,
            icon: FaIcon(
              suffixIcon,
              size: 16.h,
              color: colorIcon ?? AppColor.background,
            ),
          ),
          prefixIcon: IconButton(
            onPressed: onPressedPrefixIcon,
            icon: FaIcon(
              prefixIcon,
              size: 16.h,
              color: colorIcon ?? AppColor.background,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: isRaiusEnabled
                ? BorderRadius.all(
                    Radius.circular(25.r),
                  )
                : BorderRadius.all(
                    Radius.circular(6.r),
                  ),
            borderSide: const BorderSide(color: AppColor.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: isRaiusfocused
                ? BorderRadius.all(
                    Radius.circular(25.r),
                  )
                : BorderRadius.all(
                    Radius.circular(6.r),
                  ),
            borderSide: const BorderSide(color: AppColor.white),
          ),
          fillColor: fillColor ?? AppColor.formField,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
          hintText: hint,
          hintStyle: AppFonts.regular_13.copyWith(
            color: hintColor ?? AppColor.white,
          ),
        ),
      ),
    );
  }
}
