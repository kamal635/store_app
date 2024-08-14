import 'package:flutter/material.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';

class CustomTextOrWith extends StatelessWidget {
  const CustomTextOrWith({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Divider(
            endIndent: 10,
            color: AppColor.white,
          ),
        ),
        Text(
          title,
          style: AppFonts.semiBold_14.copyWith(color: AppColor.background),
        ),
        const Expanded(
          child: Divider(
            indent: 10,
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}
